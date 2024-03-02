import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_2s_app/core/constants/constants.dart';
import 'package:test_2s_app/features/home/data/location_repository_impl.dart';
import 'package:test_2s_app/features/home/data/remote/location_storage.dart';
import 'package:test_2s_app/features/home/domain/usecase/get_current_location.dart';
import 'package:test_2s_app/features/home/presentation/bloc/app_bloc/bloc.dart';
import 'package:test_2s_app/features/home/presentation/pages/pages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MapBloc mapBloc;

  @override
  void initState() {
    super.initState();
    final locationStorage = LocationUserStorageImpl();
    final repo = LocationRepositoryImpl(locationStorage: locationStorage);
    final getCurrentLocation = GetCurrentLocation(repository: repo);
    mapBloc = MapBloc(getCurrentLocation: getCurrentLocation);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => mapBloc,
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          currentIndex: 1,
          activeColor: CupertinoColors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.square_list_fill),
              label: 'Заявки',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
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
      ),
    );
  }
}
