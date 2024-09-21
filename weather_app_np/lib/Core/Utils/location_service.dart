import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Position> getCurrentLocation() async {
    bool isEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isEnabled) {
      return Future.error("Service Disabled");
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Permission Denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location Permission Denied Permenantly");
    }

    return await Geolocator.getCurrentPosition();
  }
}
