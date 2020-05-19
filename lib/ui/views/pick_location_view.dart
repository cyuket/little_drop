import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:little_drops/constants/route_names.dart';
import 'package:little_drops/ui/shared/app_colors.dart';
import 'package:little_drops/ui/shared/shared_styles.dart';
import 'package:little_drops/ui/shared/ui_helpers.dart';
import 'package:little_drops/ui/widgets/busy_button.dart';
import 'package:location/location.dart';

class PickUpLocation extends StatefulWidget {
  @override
  _PickUpLocationState createState() => _PickUpLocationState();
}

class _PickUpLocationState extends State<PickUpLocation> {
  GoogleMapController mapController;
  StreamSubscription _locationSubscription;
  static double latitude = 40.688841;
  static double longitude = -74.044015;
  Location _location = Location();
  Marker marker;
  Circle circle;

  // LatLng _center = LatLng(40.688841, -74.044015);
  static LatLng _center = LatLng(40.688841, -74.044015);

  static final CameraPosition initialLocation = CameraPosition(
    target: _center,
    zoom: 15.0,
  );

  Future<void> getCurrentLocation() async {
    try {
//New Codeeeeeeeeeeeeeeeeee

      var location = await _location.getLocation();
      updateMarkerAndCircle(location);

      if (_locationSubscription != null) {
        _locationSubscription.cancel();
      }
      _locationSubscription =
          _location.onLocationChanged.listen((newLocalData) {
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
          updateMarkerAndCircle(newLocalData);
        }
      });
    } catch (e) {
      // print(e);
    }

    // print(latitude);
  }

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

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    // TODO: implement initState
    getCurrentLocation();

    setState(() {});
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _locationSubscription.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    color: Colors.white,
                    elevation: 1,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          height: 48,
                          width: screenWidth(context) - 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(color: Color(0xffDADADA), width: 1),
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
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Search pickup location",
                                      hintStyle: TextStyle(fontSize: 15),
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.all(10)),
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
  }
}
