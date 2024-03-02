part of 'bloc.dart';

enum AppLoad {
  loading,
  loaded,
  error,
}

enum AppGeoConnection {
  successful,
  connection,
  error,
}

final class AppState extends Equatable {
  final String username;
  final AppLoad appLoad;
  final AppGeoConnection appGeoConnection;

  const AppState({
    required this.username,
    required this.appLoad,
    required this.appGeoConnection,
  });

  AppState copyWith({
    String? username,
    AppLoad? appLoad,
    AppGeoConnection? appGeoConnection,
  }) {
    return AppState(
      username: username ?? this.username,
      appLoad: appLoad ?? this.appLoad,
      appGeoConnection: appGeoConnection ?? this.appGeoConnection,
    );
  }

  @override
  List<Object?> get props => [username];
}
