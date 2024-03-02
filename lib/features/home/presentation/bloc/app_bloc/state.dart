part of 'bloc.dart';

final class MapState extends Equatable {
  final AppGeoConnection appGeoConnection;
  final double latitude;
  final double longitude;

  const MapState({
    required this.appGeoConnection,
    required this.latitude,
    required this.longitude,
  });

  MapState copyWith({
    AppGeoConnection? appGeoConnection,
    double? latitude,
    double? longitude,
  }) {
    return MapState(
      appGeoConnection: appGeoConnection ?? this.appGeoConnection,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  @override
  List<Object?> get props => [
        appGeoConnection,
        latitude,
        longitude,
      ];
}
