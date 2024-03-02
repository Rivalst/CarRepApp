import 'package:test_2s_app/features/home/domain/repository/location_repository.dart';

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
