import 'package:flutter/cupertino.dart';
import 'package:octopus/octopus.dart';

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

Octopus router(AppState state) {
  final route = Octopus(
    routes: Routes.values,
    defaultRoute: switch (state.appView) {
      AppView.welcome => Routes.welcome,
      AppView.home => Routes.home,
      AppView.loading => Routes.loading,
    },
  );

  return route;
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

enum Routes with OctopusRoute {
  home('home', title: 'Home'),
  welcome('welcome', title: 'Welcome'),
  loading('loading', title: 'loading');

  @override
  final String? title;

  @override
  final String name;

  const Routes(this.name, {this.title});

  @override
  Widget builder(
    BuildContext context,
    OctopusState state,
    OctopusNode node,
  ) =>
      switch (this) {
        Routes.home => const HomeScreen(),
        Routes.welcome => const WelcomeScreen(),
        Routes.loading => const Center(
            child: CupertinoActivityIndicator(),
          ),
      };
}
