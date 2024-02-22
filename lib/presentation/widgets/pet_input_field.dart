import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/theme/constants/constants.dart';

enum InputPetType {
  inputPetWeight,
  inputPetDefault,
}

class PetInputField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final TextInputAction? textInputAction;
  final String? hintText;
  final String? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool obscureText;
  final String errorText;
  final VoidCallback? onTap;
  final bool enabled;
  final InputPetType inputPetType;

  const PetInputField({
    Key? key,
    this.textEditingController,
    this.textInputAction,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.maxLength,
    this.obscureText = false,
    this.errorText = 'must have at least 3 characters',
    this.enabled = true,
    this.onTap,
    this.inputPetType = InputPetType.inputPetDefault,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: textEditingController,
      textInputAction: textInputAction,
      maxLength: maxLength,
      autofocus: false,
      keyboardType: keyboardType,
      obscureText: obscureText,
      enabled: enabled,
      onFieldSubmitted: (value) {},
      onChanged: (value) {
        if (inputPetType == InputPetType.inputPetDefault) {
          // TODO refactor this valdition to get a new keybordType
          if (textEditingController != null &&
              textEditingController!.text.startsWith('0') &&
              keyboardType == TextInputType.number) {
            textEditingController!.text = '';
          }
        } else if (inputPetType == InputPetType.inputPetWeight) {
          if (keyboardType == TextInputType.number) {
            // TODO refactor here
          } else {
            textEditingController!.text = '';
          }
        }
      },
      validator: (value) {
        if (value == null) return 'this field is required';
        return value.length < 3 ? errorText : null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          hintText: hintText,
          counterText: '',
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: defaultPadding * 0.75),
                  child: SvgPicture.asset(prefixIcon!,
                      height: 24,
                      width: 24,
                      color: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .color!
                          .withOpacity(0.3)),
                )
              : null,
          suffixIcon: suffixIcon != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: defaultPadding * 0.75),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: defaultPadding * 0.75),
                      child: suffixIcon),
                )
              : null),
    );
  }
}
