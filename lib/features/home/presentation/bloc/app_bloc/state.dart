part of 'bloc.dart';

/// Represents the current state of the map, including the application's geo-connection status 
/// [AppGeoConnection], latitude, and longitude. 
/// The MapState class is immutable and can be copied with updated values using the 
/// copyWith method. The props list includes appGeoConnection, latitude, and longitude
/// for equality comparison.
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
