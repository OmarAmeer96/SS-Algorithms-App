import 'package:flutter/material.dart';
import 'package:ss_algorithms_app/Core/utils/styles.dart';

class CustomMainButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color color;
  final Color textColor;
  final Color borderSideColor;
  final double width;

  const CustomMainButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    this.textColor = Colors.white,
    this.borderSideColor = Colors.transparent,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(19),
          side: BorderSide(color: borderSideColor),
        ),
      ),
      child: Container(
        // width: 367,
        width: width,
        height: 49,
        alignment: Alignment.center,
        child: Text(
          text,
          style: Styles.sFProDisplayBold.copyWith(
            color: textColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}