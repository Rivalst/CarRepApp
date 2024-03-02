import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'event.dart';
part 'state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc()
      : super(const AppState(
          username: '',
          appLoad: AppLoad.loading,
          appGeoConnection: AppGeoConnection.connection,
        )) {
    on<AppEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
