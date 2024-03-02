import 'package:flutter/cupertino.dart';
import 'package:test_2s_app/core/constants/constants.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(40.0),
            ),
            color: kGreenMainColor,
          ),
        ),
      ),
    );
  }
}
