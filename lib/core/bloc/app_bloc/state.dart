part of 'bloc.dart';

final class AppState extends Equatable {
  final String username;
  final AppLoad appLoad;
  final AppView appView;

  const AppState({
    required this.username,
    required this.appLoad,
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
      appView: appView ?? this.appView,
    );
  }

  @override
  List<Object?> get props => [
        username,
        appLoad,
        appView,
      ];
}
