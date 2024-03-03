import 'package:flutter/widgets.dart';

import 'package:shared_preferences/shared_preferences.dart';

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
