part of 'bloc.dart';

sealed class MapEvent extends Equatable {}

/// Event representing that the map has been loaded, 
/// triggering the retrieval of the current location.
final class MapLoaded extends MapEvent {
  @override
  List<Object?> get props => [];
}
