import 'package:flutter/cupertino.dart';

import 'package:test_2s_app/core/constants/constants.dart';
import 'package:test_2s_app/features/home/presentation/pages/pages.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: 1,
        activeColor: CupertinoColors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Заявки',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Головна',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Особисті данні',
          ),
        ],
        border: Border.all(color: kBackgroundColor),
      ),
      tabBuilder: (context, index) {
        return switch (index) {
          0 => const RequestsPage(),
          1 => const MainPage(),
          2 => const PersonalDataPage(),
          _ => const MainPage(),
        };
      },
    );
  }
}
