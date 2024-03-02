import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:test_2s_app/core/constants/constants.dart';

class WelcomeCardCart extends StatelessWidget {
  final String userName;
  const WelcomeCardCart({
    required this.userName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40.0),
          bottomRight: Radius.circular(40.0),
        ),
        color: kGreenMainColor,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Stack(
          children: [
            const Image(
              image: AssetImage('assets/image_car.png'),
            ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  children: [
                    _leftColumn(),
                    _rightColumn(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _leftColumn() {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Привіт, ',
                style: TextStyle(fontSize: 16.0, color: CupertinoColors.white),
              ),
              Text(
                userName,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.white,
                ),
              ),
            ],
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Додавання авто',
                  style: TextStyle(
                    fontSize: 10.0,
                    color: CupertinoColors.systemGrey,
                  ),
                ),
                Gap(5.0),
                Text(
                  'Завантажте дані про ваше авто для кращого використання сервісу.',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: CupertinoColors.white,
                  ),
                ),
              ],
            ),
          ),
          CupertinoButton(
            onPressed: () => null,
            padding: EdgeInsets.zero,
            alignment: Alignment.centerLeft,
            child: const Text(
              'Додати авто >',
              style: TextStyle(
                  color: kGreenMainColor,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _rightColumn() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(
                height: 30,
                width: 30,
              ),
              Transform.rotate(
                angle: 0.3,
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(13)),
                    color: kSmallCardColor,
                  ),
                ),
              ),
            ],
          ),
          const Gap(5.0),
          Transform.rotate(
            angle: -0.3,
            child: Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(13)),
                color: kSmallCardColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
