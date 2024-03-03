/// Abstract class representing a location repository,
/// which defines a method getCurrentLocation() for retrieving the current
/// latitude and longitude coordinates asynchronously.
/// Implementations of this class will provide concrete logic for fetching the location data.
abstract class LocationRepository {
  Future<(double, double)> getCurrentLocation();
}
