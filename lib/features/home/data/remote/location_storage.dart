import 'package:geolocator/geolocator.dart';

abstract class LocationStorage {
  Future<(double, double)> getCurrentLocation();
}

class LocationUserStorageImpl implements LocationStorage {
  @override
  Future<(double, double)> getCurrentLocation() async {
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      final permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // if the user does not specify a location, then send an error
        return Future.error('Location permissions are denied');
      }
    }

    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    final latitude = position.latitude;
    final longitude = position.longitude;

    final locationData = (latitude, longitude);

    return locationData;
  }
}
