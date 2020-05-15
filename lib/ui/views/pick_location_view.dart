import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
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
      // print("jsksksk");
      // Position position = await Geolocator()
      //     .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      // print(position);
      // setState(() {
      //   latitude = position.latitude;
      //   longitude = position.longitude;

      // });

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
        rotation: locationData.heading,
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
    if (_locationSubscription != null) {
      _locationSubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps Sample App'),
        backgroundColor: Colors.green[700],
      ),
      body: GoogleMap(
          mapType: MapType.normal,
          onMapCreated: _onMapCreated,
          markers: Set.of((marker != null) ? [marker] : []),
          initialCameraPosition: initialLocation),
    );
  }
}
