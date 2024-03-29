import 'package:flutter/cupertino.dart';

import 'package:test_2s_app/core/constants/constants.dart';

/// Widget error page to display when an error occurs in the application.
class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: Padding(
        padding: EdgeInsets.all(kMainPadding),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Uuups. There is some error :(',
                style: TextStyle(color: CupertinoColors.white, fontSize: 16.0),
              ),
              Text(
                'Please reastart the app.',
                style: TextStyle(
                  color: CupertinoColors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
