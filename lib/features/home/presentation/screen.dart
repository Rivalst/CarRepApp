import 'package:flutter/cupertino.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      // TODO: NEED REMOVE 
      navigationBar: CupertinoNavigationBar(),
      child: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
