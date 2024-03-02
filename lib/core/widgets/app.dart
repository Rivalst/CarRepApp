import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_2s_app/core/bloc/app_bloc/bloc.dart';
import 'package:test_2s_app/features/home/presentation/screen.dart';
import 'package:test_2s_app/features/welcome/presentation/screen.dart';

class AppRouteConfig extends StatelessWidget {
  const AppRouteConfig({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        context.read<AppBloc>().add(AppLoaded());
        return switch (state.appView) {
          AppView.welcome => const WelcomeScreen(),
          AppView.home => const HomeScreen(),
          AppView.loading => const Center(
              child: CupertinoActivityIndicator(),
            )
        };
      },
    );
  }
}
