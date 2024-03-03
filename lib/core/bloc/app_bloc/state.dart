part of 'bloc.dart';

/// The AppState class encapsulates the username,
/// application load status [AppLoad], and current view [AppView].
/// It is immutable and can be copied with updated values using the copyWith method.
///
/// The props list includes username, appLoad, and appView for equality comparison.
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
