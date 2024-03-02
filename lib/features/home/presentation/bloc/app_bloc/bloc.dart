import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_2s_app/core/constants/constants.dart';
import 'package:test_2s_app/features/home/domain/usecase/get_current_location.dart';

part 'event.dart';
part 'state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final GetCurrentLocation _getCurrentLocation;

  MapBloc({
    required GetCurrentLocation getCurrentLocation,
  })  : _getCurrentLocation = getCurrentLocation,
        super(const MapState(
          appGeoConnection: AppGeoConnection.connection,
          latitude: 0,
          longitude: 0,
        )) {
    on<MapLoaded>(_currentLocationGetter);
  }

  Future<void> _currentLocationGetter(
    MapLoaded event,
    Emitter<MapState> emit,
  ) async {
    try {
      final location = await _getCurrentLocation();
      emit(
        state.copyWith(
          appGeoConnection: AppGeoConnection.successful,
          latitude: location.$1,
          longitude: location.$2,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(appGeoConnection: AppGeoConnection.error),
      );
    }
  }
}
