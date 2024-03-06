import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_2s_app/core/bloc/app_bloc/bloc.dart';
import 'package:test_2s_app/features/home/presentation/screen.dart';
import 'package:test_2s_app/features/welcome/presentation/screen.dart';

// colors
const kBackgroundColor = Color(0xFF1E1E1E);
const kButtonBackgroundColor = Color(0xFF292929);
const kGreenMainColor = Color(0xFF0CBA70);
const kSmallCardColor = Color(0xFF383838);

// int
const kSmallPadding = 8.0;
const kMediumPadding = 16.0;
const kMainPadding = 20.0;
const kWelcomeScreenTopPadding = 40.0;
const kBorderRadius = 16.0;
const kGapSize = 20.0;

// another

late SharedPreferences sharedPreferences;

/// Main route config for the app
GoRouter router(AppState appState) {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => const CupertinoPage(
          child: WelcomeScreen(),
        ),
      ),
      GoRoute(
        path: '/home',
        pageBuilder: (context, state) => const CupertinoPage(
          child: HomeScreen(),
        ),
      ),
      GoRoute(
        path: '/loading',
        pageBuilder: (context, state) => const CupertinoPage(
          child: Center(
            child: CupertinoActivityIndicator(),
          ),
        ),
      ),
    ],
    redirect: (context, state) {
      return switch (appState.appView) {
        AppView.welcome => '/',
        AppView.home => '/home',
        AppView.loading => '/loading',
      };
    },
  );
}

// enum
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
