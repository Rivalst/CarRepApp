import 'package:test_2s_app/features/home/data/remote/location_storage.dart';
import 'package:test_2s_app/features/home/domain/repository/location_repository.dart';

/// Implementation of the LocationRepository interface.
/// This class retrieves the current location using the provided LocationStorage service.
/// It implements the getCurrentLocation() method to fetch the latitude and longitude
/// coordinates asynchronously from the storage.
class LocationRepositoryImpl implements LocationRepository {
  final LocationStorage _locationStorage;

  LocationRepositoryImpl({
    required LocationStorage locationStorage,
  }) : _locationStorage = locationStorage;

  @override
  Future<(double, double)> getCurrentLocation() async {
    final location = await _locationStorage.getCurrentLocation();
    return location;
  }
}
