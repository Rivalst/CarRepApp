part of 'bloc.dart';

sealed class AppEvent extends Equatable {}

final class AppLoaded extends AppEvent {
  final String username;

  AppLoaded({required this.username});

  @override
  List<Object?> get props => [username];
}
