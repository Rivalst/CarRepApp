import 'package:geolocator/geolocator.dart';

/// Abstract class representing a location storage, which defines a method getCurrentLocation()
/// for retrieving the current latitude and longitude coordinates asynchronously.
abstract class LocationStorage {
  Future<(double, double)> getCurrentLocation();
}

/// Implementation of the [LocationStorage] interface. This class retrieves the current
/// location using the device's geolocation services. It implements the getCurrentLocation()
/// method to request permission from the user and fetch the latitude and longitude
/// coordinates using the [Geolocator] package. If the user denies permission,
/// it returns an error message indicating that location permissions are denied.
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
