import 'package:flutter/material.dart';
import 'package:ss_algorithms_app/Core/utils/styles.dart';
import 'package:ss_algorithms_app/Core/widgets/custom_main_button.dart';
import 'package:ss_algorithms_app/Core/widgets/custom_main_text_field.dart';
import 'package:ss_algorithms_app/constants.dart';

class VigenereItem extends StatelessWidget {
  const VigenereItem({
    super.key,
    required this.onPressed1,
    required this.onPressed2,
    required this.text,
    this.onChanged1,
    this.controller1,
    this.validator1,
    this.onChanged2,
    this.controller2,
    this.validator2,
    required this.maxInputLength,
    required this.maxKeyLength,
    this.inputType = TextInputType.text,
  });

  final void Function()? onPressed1;
  final void Function()? onPressed2;

  final String text;

  final Function(String)? onChanged1;
  final TextEditingController? controller1;
  final String? Function(String?)? validator1;

  final Function(dynamic)? onChanged2;
  final TextEditingController? controller2;
  final String? Function(String?)? validator2;

  final int maxInputLength;
  final int maxKeyLength;

  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      width: double.infinity,
      child: Center(
        child: Column(
          children: [
            Text(
              text,
              style: Styles.sFProDisplayBold.copyWith(
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomMainTextField(
                    maxLength: maxInputLength,
                    onChanged: onChanged1,
                    controller: controller1,
                    validator: validator1,
                    hintText: 'Enter String',
                    borderColor: Colors.white,
                    focusedBorderColor: kButtonColor2,
                    enabledBorderColor: Colors.white,
                    inputType: inputType,
                    obscureText: false,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: CustomMainTextField(
                    inputType: TextInputType.text,
                    maxLength: maxKeyLength,
                    onChanged: onChanged2,
                    controller: controller2,
                    validator: validator2,
                    hintText: 'Enter Key',
                    borderColor: Colors.white,
                    focusedBorderColor: kButtonColor2,
                    enabledBorderColor: Colors.white,
                    obscureText: false,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomMainButton(
                    text: "Encryption",
                    onPressed: onPressed1,
                    color: kButtonColor1,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: CustomMainButton(
                    text: "Decryption",
                    onPressed: onPressed2,
                    color: kButtonColor2,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
