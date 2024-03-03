import 'package:flutter/cupertino.dart';
import 'package:test_2s_app/core/constants/constants.dart';

/// Simple main green button in the app
class MainGreenButton extends StatelessWidget {
  const MainGreenButton({
    required this.context,
    required this.buttonName,
    required this.onPressed,
    super.key,
  });
  final BuildContext context;
  final String buttonName;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
        height: 55,
        child: CupertinoButton(
          onPressed: onPressed,
          color: kGreenMainColor,
          minSize: double.maxFinite,
          borderRadius: BorderRadius.circular(kBorderRadius),
          child: Text(
            buttonName,
            style: const TextStyle(
              color: CupertinoColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 13.0,
            ),
          ),
        ),
      ),
    );
  }
}
