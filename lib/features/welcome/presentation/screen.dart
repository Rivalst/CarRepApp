import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:test_2s_app/core/constants/constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            kMediumPadding,
            kWelcomeScreenTopPadding,
            kMediumPadding,
            kMediumPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 257,
                child: Column(
                  children: [
                    Text(
                      'Як до вас звертатися?',
                      style: TextStyle(
                        color: CupertinoColors.white,
                        fontSize: 19.0,
                        fontWeight: FontWeight.bold,
                      ),
                      softWrap: true,
                    ),
                    Gap(kGapSize),
                    Text(
                      'Будь ласка, укажіть ваше ім\'я для персоналізації сервісу.',
                      style: TextStyle(
                        color: CupertinoColors.white,
                        fontSize: 12.0,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
              const Gap(kGapSize),
              SizedBox(
                width: 331,
                height: 47,
                child: CupertinoTextField(
                  style: const TextStyle(color: CupertinoColors.white),
                  placeholder: 'Ваше імʼя',
                  placeholderStyle: const TextStyle(
                    color: CupertinoColors.systemGrey,
                    fontSize: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: kButtonBackgroundColor,
                    border: Border.all(color: kGreenMainColor),
                    borderRadius: BorderRadius.circular(kBorderRadius),
                  ),
                  cursorColor: kGreenMainColor,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 454,
                height: 47,
                child: CupertinoButton(
                  onPressed: () => null,
                  color: kGreenMainColor,
                  borderRadius: BorderRadius.circular(kBorderRadius),
                  child: const Text(
                    'Продовжити',
                    style: TextStyle(
                      color: CupertinoColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
