import 'package:flutter/material.dart';

import '../../../config/theme/constants/constants.dart';

class PetButtonSelectable extends StatelessWidget {
  final bool isSelected;
  final IconData iconData;
  final String petButtonText;
  final VoidCallback? onTap;

  const PetButtonSelectable({
    Key? key,
    required this.isSelected,
    required this.iconData,
    required this.petButtonText,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : whiteColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: isSelected ? primaryColor : greyColor),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              iconData,
              color: isSelected ? whiteColor : blackColor80,
            ),
            const SizedBox(width: 8),
            Text(
              petButtonText,
              style: TextStyle(
                color: isSelected ? whiteColor : blackColor80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
