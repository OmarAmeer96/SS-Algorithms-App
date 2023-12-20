import 'package:flutter/material.dart';
import 'package:ss_algorithms_app/Core/utils/styles.dart';
import 'package:ss_algorithms_app/constants.dart';

class CustomKeyTextField extends StatelessWidget {
  const CustomKeyTextField({
    super.key,
    this.onChanged,
    this.controller,
    this.validator,
    required this.hintText,
    required this.borderColor,
    required this.focusedBorderColor,
    required this.enabledBorderColor,
    this.prefixIcon,
    this.suffixIcon,
    required this.obscureText,
    this.labelText,
  });

  final Function(dynamic)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  final String hintText;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color enabledBorderColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      enabled: true,
      keyboardType: TextInputType.number,
      style: Styles.sFProDisplayBold.copyWith(
        color: Colors.white,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        floatingLabelStyle: Styles.sFProDisplayBold.copyWith(
          color: kPrimaryColor,
        ),
        constraints: const BoxConstraints(
          // maxHeight: 80,
          minHeight: 40,
          maxWidth: double.infinity,
          minWidth: double.infinity,
        ),
        hintText: hintText,
        hintStyle: Styles.sFProDisplayBold.copyWith(
          color: const Color(0xFF757575),
          fontSize: 16,
        ),
        labelText: labelText,
        labelStyle: Styles.sFProDisplayBold.copyWith(
          color: const Color(0xFF757575),
          fontSize: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: borderColor, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: focusedBorderColor, width: 2.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: enabledBorderColor, width: 1.0),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      validator: validator,
    );
  }
}
