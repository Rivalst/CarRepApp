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

enum AppView {
  welcome,
  home,
  loading,
}

final class AppState extends Equatable {
  final String username;
  final AppLoad appLoad;
  final AppGeoConnection appGeoConnection;
  final AppView appView;

  const AppState({
    required this.username,
    required this.appLoad,
    required this.appGeoConnection,
    required this.appView,
  });

  AppState copyWith({
    String? username,
    AppLoad? appLoad,
    AppGeoConnection? appGeoConnection,
    AppView? appView,
  }) {
    return AppState(
      username: username ?? this.username,
      appLoad: appLoad ?? this.appLoad,
      appGeoConnection: appGeoConnection ?? this.appGeoConnection,
      appView: appView ?? this.appView,
    );
  }

  @override
  List<Object?> get props => [
        username,
        appLoad,
        appGeoConnection,
        appView,
      ];
}
