import 'package:geolocator/geolocator.dart';

class GeoLocation {

  static Future<Position> fetchPosition() async {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }

}