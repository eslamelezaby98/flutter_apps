import 'package:geolocator/geolocator.dart';

class LocationServices {
  static Future<Position> getcurrentLocation() async {
    bool isPermessionEnable = await Geolocator.isLocationServiceEnabled();
    if (!isPermessionEnable) {
      await Geolocator.requestPermission();
    }
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}
