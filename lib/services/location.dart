import 'package:geolocator/geolocator.dart';

class Location {
  double lattitude;
  double logitude;

  Future<void> getCurrentLocatiuon() async {
    try {
      Position pos = await Geolocator.getCurrentPosition(
          forceAndroidLocationManager: true,
          desiredAccuracy: LocationAccuracy.low);
      print(pos);
      lattitude = pos.latitude;
      logitude = pos.longitude;
    } catch (e) {
      print(e);
    }
  }
}
