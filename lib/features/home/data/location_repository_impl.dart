import 'package:test_2s_app/features/home/data/remote/location_storage.dart';
import 'package:test_2s_app/features/home/domain/repository/location_repository.dart';

class LocationRepositoryImpl extends LocationRepository {
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
