part of 'bloc.dart';

sealed class AppEvent extends Equatable {}

/// Event indicating that the application has been loaded.
final class AppLoaded extends AppEvent {
  @override
  List<Object?> get props => [];
}

/// Event indicating that a button has been pressed, typically used for setting the username.
final class ButtonPressed extends AppEvent {
  final String username;

  ButtonPressed({required this.username});

  @override
  List<Object?> get props => [username];
}
