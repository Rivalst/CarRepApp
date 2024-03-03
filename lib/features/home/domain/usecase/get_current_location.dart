import 'package:test_2s_app/features/home/domain/repository/location_repository.dart';

/// Service responsible for retrieving the current location.
/// It utilizes the [LocationRepository] to fetch the location data asynchronously.
/// The [GetCurrentLocation] class encapsulates the logic for obtaining the latitude and
/// longitude coordinates and returns them as a tuple (double, double).
class GetCurrentLocation {
  final LocationRepository _repository;

  GetCurrentLocation({
    required LocationRepository repository,
  }) : _repository = repository;

  Future<(double, double)> call() async {
    final location = await _repository.getCurrentLocation();
    return location;
  }
}
