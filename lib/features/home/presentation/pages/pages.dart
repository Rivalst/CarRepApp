import 'package:flutter/cupertino.dart';
import 'package:test_2s_app/core/constants/constants.dart';
import 'package:test_2s_app/core/widgets/button.dart';
import 'package:test_2s_app/features/home/presentation/widgets/card_widgets.dart';
import 'package:test_2s_app/features/home/presentation/widgets/map_widgets.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                const WelcomeCardCart(),
                const MapWidget(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
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

class PersonalDataPage extends StatelessWidget {
  const PersonalDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabView(
      builder: (context) {
        return const CupertinoPageScaffold(
          child: Center(
            child: Text('Особисті Данні'),
          ),
        );
      },
    );
  }
}
