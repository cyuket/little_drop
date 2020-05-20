import 'package:location/location.dart';

class GetLocation {
  static Location location = Location();

  static Future currentLocation() async {
    var currentLocation = await location.getLocation();

    return currentLocation;
  }

  // Future selectedLocation() async {
  //   var newLocation = await location.;
  // }
}
