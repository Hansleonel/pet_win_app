import 'package:flutter/material.dart';

import '../../../config/theme/constants/constants.dart';

class AppBarStepper extends StatelessWidget {
  final int orderActivate;
  const AppBarStepper({Key? key, required this.orderActivate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 96),
        Container(
          width: 32.0,
          height: 4.0,
          decoration: BoxDecoration(
            color: orderActivate == 1 ? primaryColor : greyColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(4.0),
            ),
          ),
        ),
        const SizedBox(width: 4),
        Container(
          width: 32.0,
          height: 4.0,
          decoration: BoxDecoration(
            color: orderActivate == 2 ? primaryColor : greyColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(4.0),
            ),
          ),
        ),
      ],
    );
  }
}
