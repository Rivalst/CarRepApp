part of 'bloc.dart';

sealed class MapEvent extends Equatable {}

final class MapLoaded extends MapEvent {
  @override
  List<Object?> get props => [];
}
