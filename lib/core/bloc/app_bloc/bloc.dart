import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_2s_app/core/constants/constants.dart';
import 'package:test_2s_app/core/domain/usecase/get_username.dart';
import 'package:test_2s_app/core/domain/usecase/set_username.dart';

part 'event.dart';
part 'state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final GetUserName _getUserName;
  final SetUserName _setUserName;
  AppBloc({
    required GetUserName getUserName,
    required SetUserName setUserName,
  })  : _getUserName = getUserName,
        _setUserName = setUserName,
        super(const AppState(
          username: '',
          appLoad: AppLoad.loading,
          appView: AppView.loading,
          appGeoConnection: AppGeoConnection.connection,
        )) {
    on<AppLoaded>(_usernameGetter);
    on<ButtonPressed>(_usernameSetter);
  }

  Future<void> _usernameGetter(
    AppLoaded event,
    Emitter<AppState> emit,
  ) async {
    try {
      final username = await _getUserName();
      emit(
        state.copyWith(
          username: username,
          appView: username.isEmpty ? AppView.welcome : AppView.home,
          appLoad: AppLoad.loaded,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(appLoad: AppLoad.error),
      );
    }
  }

  Future<void> _usernameSetter(
    ButtonPressed event,
    Emitter<AppState> emit,
  ) async {
    try {
      await _setUserName(event.username);
      emit(
        state.copyWith(
          username: event.username,
          appLoad: AppLoad.loaded,
          appView: event.username.isEmpty ? AppView.welcome : AppView.home,
          appGeoConnection: AppGeoConnection.connection,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(appLoad: AppLoad.error),
      );
    }
  }
}
