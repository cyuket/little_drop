import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:little_drops/constants/route_names.dart';
import 'package:little_drops/ui/shared/app_colors.dart';
import 'package:little_drops/ui/shared/location.dart';
import 'package:little_drops/ui/shared/shared_styles.dart';
import 'package:little_drops/ui/shared/ui_helpers.dart';
import 'package:little_drops/ui/widgets/busy_button.dart';
import 'package:little_drops/viewModel/map_view_model.dart';
import 'package:location/location.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:geocoder/geocoder.dart';
import 'package:little_drops/constants/mapKey.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

class PickUpLocation extends StatefulWidget {
  @override
  _PickUpLocationState createState() => _PickUpLocationState();
}

class _PickUpLocationState extends State<PickUpLocation> {
  final homeScaffoldKey = GlobalKey<ScaffoldState>();
  //map variables
  final pickUpController = TextEditingController();
  GoogleMapController mapController;
  StreamSubscription _locationSubscription;
  var _location = GetLocation.location;
  Marker marker;
  Circle circle;
  static LatLng _center = LatLng(40.688841, -74.044015);
  static final CameraPosition initialLocation = CameraPosition(
    target: _center,
    zoom: 15.0,
  );
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  //prediction variables
  Mode _mode = Mode.overlay;
  void onError(PlacesAutocompleteResponse response) {
    homeScaffoldKey.currentState.showSnackBar(
      SnackBar(content: Text(response.errorMessage)),
    );
  }

  // function to handle modal for search for location
  Future<void> _handlePressButton() async {
    Prediction p = await PlacesAutocomplete.show(
      context: context,
      apiKey: kGoogleApiKey,
      onError: onError,
      mode: _mode,
      language: "ng",
      components: [Component(Component.country, "ng")],
    );
    displayPrediction(p, homeScaffoldKey.currentState);
  }

  // function to handle  display of modal
  Future<Null> displayPrediction(Prediction p, ScaffoldState scaffold) async {
    if (p != null) {
      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId);
      final lat = detail.result.geometry.location.lat;
      final lng = detail.result.geometry.location.lng;
      pickUpController.text = p.description;
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          new CameraPosition(
              target: LatLng(lat, lng), bearing: 192, tilt: 0, zoom: 18),
        ),
      );
      // Change of location marker';
      LatLng latLng = LatLng(lat, lng);
      this.setState(() {
        marker = Marker(
          markerId: MarkerId("My Location"),
          position: latLng,
          // rotation: locationData.altitude,
          draggable: false,
          flat: false,
          // anchor: Offset(0.5, 0.5),
          zIndex: 2,
          icon: BitmapDescriptor.defaultMarker,
        );
      });
      // scaffold.showSnackBar(
      //   SnackBar(content: Text("${p.description} - $lat/$lng")),
      // );
    }
  }

// getting currnt location
  Future<void> getCurrentLocation() async {
    try {
      var location = await GetLocation.currentLocation();
      updateMarkerAndCircle(location);

      if (_locationSubscription != null) {
        _locationSubscription.cancel();
      }
      _locationSubscription =
          _location.onLocationChanged.listen((newLocalData) async {
        if (mapController != null) {
          mapController.animateCamera(
            CameraUpdate.newCameraPosition(
              new CameraPosition(
                  target: LatLng(newLocalData.latitude, newLocalData.longitude),
                  bearing: 192,
                  tilt: 0,
                  zoom: 18),
            ),
          );

          final coordinates =
              new Coordinates(newLocalData.latitude, newLocalData.longitude);
          var addresses =
              await Geocoder.local.findAddressesFromCoordinates(coordinates);
          var first = addresses.first;

          pickUpController.text = first.locality;
          updateMarkerAndCircle(newLocalData);
        }
      });
      // _locationSubscription.pause();
    } catch (e) {}
  }

  // function to update marker
  void updateMarkerAndCircle(LocationData locationData) {
    LatLng latLng = LatLng(locationData.latitude, locationData.longitude);
    this.setState(() {
      marker = Marker(
        markerId: MarkerId("My Location"),
        position: latLng,
        rotation: locationData.altitude,
        draggable: false,
        flat: false,
        // anchor: Offset(0.5, 0.5),
        zIndex: 2,
        icon: BitmapDescriptor.defaultMarker,
      );
    });
  }

  @override
  void initState() {
    getCurrentLocation();
    setState(() {});
    super.initState();
  }

  @override
  void dispose() {
    _locationSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<MapViewModel>.withConsumer(
        viewModelBuilder: () => MapViewModel(),
        builder: (context, data, child) {
          return Scaffold(
            key: homeScaffoldKey,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: AppColors().background,
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColors().primaryColor,
                ),
              ),
            ),
            body: Stack(
              children: <Widget>[
                GoogleMap(
                  mapType: MapType.normal,
                  onMapCreated: _onMapCreated,
                  markers: Set.of((marker != null) ? [marker] : []),
                  initialCameraPosition: initialLocation,
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: screenWidth(context),
                    height: 195,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Where would you like us to pick your clothes?",
                          style: mapStyle,
                        ),
                        verticalSpace(15),
                        Card(
                          elevation: 1,
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                height: 48,
                                width: screenWidth(context) - 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: Color(0xffDADADA), width: 1),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.search,
                                      color: Color(0xffDADADA),
                                    ),
                                    horizontalSpaceSmall,
                                    Expanded(
                                      child: InkWell(
                                        onTap: _handlePressButton,
                                        child: IgnorePointer(
                                          child: TextFormField(
                                            controller: pickUpController,
                                            decoration: InputDecoration(
                                                hintText:
                                                    "Search pickup location",
                                                hintStyle:
                                                    TextStyle(fontSize: 15),
                                                border: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                contentPadding:
                                                    EdgeInsets.all(10)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        verticalSpace(15),
                        BusyButton(
                          onPressed: () {
                            data.updatePickupAdrees(pickUpController.text);
                            Navigator.pushNamed(context, PickUpDateViewRoute);
                          },
                          title: "Next",
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
