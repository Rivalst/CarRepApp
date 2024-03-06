import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:test_2s_app/core/bloc/app_bloc/bloc.dart';
import 'package:test_2s_app/core/constants/constants.dart';
import 'package:test_2s_app/core/data/local/local_storage.dart';
import 'package:test_2s_app/core/data/user_repository_impl.dart';
import 'package:test_2s_app/core/domain/usecase/get_username.dart';
import 'package:test_2s_app/core/domain/usecase/set_username.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(AppRoot(
    sharedPreferences: sharedPreferences,
  ));
}

class AppRoot extends StatefulWidget {
  const AppRoot({
    required this.sharedPreferences,
    super.key,
  });
  final SharedPreferences sharedPreferences;

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  late AppBloc appBloc;

  @override
  void initState() {
    final localStorage =
        LocalUserStorageImpl(sharedPreferences: sharedPreferences);
    final repo = UserRepositoryImpl(localUserStorage: localStorage);
    final getUserName = GetUserName(repository: repo);
    final setUserName = SetUserName(localUserStorage: localStorage);
    appBloc = AppBloc(
      getUserName: getUserName,
      setUserName: setUserName,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => appBloc,
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          context.read<AppBloc>().add(AppLoaded());
          return CupertinoApp.router(
            debugShowCheckedModeBanner: false,
            theme: const CupertinoThemeData(
              scaffoldBackgroundColor: kBackgroundColor,
              barBackgroundColor: kBackgroundColor,
            ),
            routerConfig: router(state).config,
          );
        },
      ),
    );
  }
}
