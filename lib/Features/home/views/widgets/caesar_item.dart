import 'package:flutter/material.dart';
import 'package:ss_algorithms_app/Core/utils/styles.dart';
import 'package:ss_algorithms_app/Core/widgets/custom_key_text_field.dart';
import 'package:ss_algorithms_app/Core/widgets/custom_main_button.dart';
import 'package:ss_algorithms_app/Core/widgets/custom_main_text_field.dart';
import 'package:ss_algorithms_app/constants.dart';

class CaesarItem extends StatelessWidget {
  const CaesarItem({
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
    this.inputType = TextInputType.text,
    required this.isLoading,
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

  final TextInputType inputType;

  final bool isLoading;

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
                  child: CustomKeyTextField(
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
                    isLoading: isLoading,
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
                    isLoading: isLoading,
                    text: "Decryption",
                    onPressed: onPressed2,
                    color: kButtonColor2,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
