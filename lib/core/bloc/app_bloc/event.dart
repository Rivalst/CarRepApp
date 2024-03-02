part of 'bloc.dart';

sealed class AppEvent extends Equatable {}

final class AppLoaded extends AppEvent {
  @override
  List<Object?> get props => [];
}

final class ButtonPressed extends AppEvent {
  final String username;

  ButtonPressed({required this.username});

  @override
  List<Object?> get props => [username];
}
