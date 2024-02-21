import 'package:flutter/material.dart';

class PetDivider extends StatelessWidget {
  final double? height;

  const PetDivider({Key? key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.grey,
      height: height ?? 8.0,
    );
  }
}
