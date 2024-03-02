import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:test_2s_app/core/bloc/app_bloc/bloc.dart';
import 'package:test_2s_app/core/constants/constants.dart';
import 'package:test_2s_app/core/widgets/button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late TextEditingController _controller;
  late AppBloc _appBloc;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _appBloc = context.read<AppBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          border: null,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _welcomeText(),
                const Gap(kGapSize),
                _textField(),
                const Spacer(),
                MainGreenButton(
                  context: context,
                  buttonName: "Продовжити",
                  onPressed: () => _buttonPress(context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _welcomeText() {
    return const SizedBox(
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
    );
  }

  Widget _textField() {
    return SizedBox(
      height: 55,
      child: CupertinoTextField(
        style: const TextStyle(color: CupertinoColors.white),
        padding: const EdgeInsets.only(left: 16.0),
        controller: _controller,
        placeholder: 'Ваше імʼя',
        placeholderStyle: const TextStyle(
          color: CupertinoColors.systemGrey,
          fontSize: 13.0,
        ),
        decoration: BoxDecoration(
          color: kButtonBackgroundColor,
          border: Border.all(color: kGreenMainColor),
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        cursorColor: kGreenMainColor,
      ),
    );
  }

  Future<void> _buttonPress(BuildContext context) async {
    if (_controller.text.isNotEmpty) {
      _appBloc.add(
        ButtonPressed(username: _controller.text),
      );
    }
  }
}
