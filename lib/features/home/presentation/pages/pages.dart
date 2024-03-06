import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_2s_app/core/bloc/app_bloc/bloc.dart';
import 'package:test_2s_app/core/constants/constants.dart';
import 'package:test_2s_app/core/widgets/button.dart';
import 'package:test_2s_app/features/home/presentation/widgets/card_widgets.dart';
import 'package:test_2s_app/features/home/presentation/widgets/map_widgets.dart';

/// The page that displays the [WelcomeCardCar], [MapWidget] and display
/// buttons to call the "wizard of cars ;)"
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appBlocState = context.read<AppBloc>().state;
    return CupertinoTabView(
      builder: (context) {
        return CupertinoPageScaffold(
          navigationBar: const CupertinoNavigationBar(
            automaticallyImplyLeading: false,
            border: null,
            middle: Text(
              'logo',
              style: TextStyle(
                color: CupertinoColors.white,
              ),
            ),
            trailing: Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(
                CupertinoIcons.phone,
                color: CupertinoColors.white,
              ),
            ),
            backgroundColor: kGreenMainColor,
          ),
          child: SafeArea(
            child: Column(
              children: [
                WelcomeCardCar(
                  userName: appBlocState.username,
                ),
                const MapWidget(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kMainPadding,
                  ),
                  child: MainGreenButton(
                    context: context,
                    buttonName: "Викликати майстра",
                    onPressed: () => _buttonPress(context),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _buttonPress(BuildContext context) {}
}

/// Page with requests user
class RequestsPage extends StatelessWidget {
  const RequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabView(
      builder: (context) {
        return const CupertinoPageScaffold(
          child: Center(
            child: Text('Заявки'),
          ),
        );
      },
    );
  }
}

/// Page with personal data about user
class PersonalDataPage extends StatelessWidget {
  const PersonalDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appBloc = context.read<AppBloc>();
    return CupertinoTabView(
      builder: (context) {
        return CupertinoPageScaffold(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Особисті Данні',
                  style: TextStyle(
                    color: CupertinoColors.white,
                  ),
                ),
                CupertinoButton(
                  onPressed: () => _buttonPress(appBloc, context),
                  child: const Text(
                    'logout',
                    style: TextStyle(
                      color: kGreenMainColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _buttonPress(
    AppBloc appBloc,
    BuildContext context,
  ) {
    appBloc.add(ButtonPressed(username: ''));

    // context.octopus.setState(
    //   (state) => state
    //     ..putIfAbsent(
    //       Routes.welcome.name,
    //       Routes.welcome.node,
    //     ),
    // );
  }
}
