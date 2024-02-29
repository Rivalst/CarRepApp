import 'package:flutter/cupertino.dart';
import 'package:test_2s_app/core/constants/constants.dart';
import 'package:test_2s_app/features/welcome/presentation/screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: const CupertinoThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        barBackgroundColor: kBackgroundColor
      ),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        return switch (settings.name) {
          '/' => CupertinoPageRoute(
              builder: (_) => const WelcomeScreen(),
            ),
          _ => CupertinoPageRoute(
              builder: (_) => const WelcomeScreen(),
            ),
        };
      },
    );
  }
}
