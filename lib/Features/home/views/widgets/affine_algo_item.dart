import 'package:flutter/material.dart';
import 'package:ss_algorithms_app/Core/utils/styles.dart';
import 'package:ss_algorithms_app/Core/widgets/custom_main_button.dart';
import 'package:ss_algorithms_app/Core/widgets/custom_main_text_field.dart';
import 'package:ss_algorithms_app/constants.dart';

class AffineAlgoItem extends StatelessWidget {
  const AffineAlgoItem({
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
    this.onChanged3,
    this.controller3,
    this.validator3,
    required this.isLoading,
  });

  final void Function()? onPressed1;
  final void Function()? onPressed2;

  final String text;

  final Function(String)? onChanged1;
  final TextEditingController? controller1;
  final String? Function(String?)? validator1;

  final Function(String)? onChanged2;
  final TextEditingController? controller2;
  final String? Function(String?)? validator2;

  final Function(String)? onChanged3;
  final TextEditingController? controller3;
  final String? Function(String?)? validator3;

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
                    hintText: 'String',
                    borderColor: Colors.white,
                    focusedBorderColor: kButtonColor2,
                    enabledBorderColor: Colors.white,
                    inputType: TextInputType.text,
                    obscureText: false,
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                Expanded(
                  child: CustomMainTextField(
                    onChanged: onChanged2,
                    controller: controller2,
                    validator: validator2,
                    hintText: 'Key (a)',
                    borderColor: Colors.white,
                    focusedBorderColor: kButtonColor2,
                    enabledBorderColor: Colors.white,
                    inputType: TextInputType.text,
                    obscureText: false,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomMainTextField(
                    onChanged: onChanged3,
                    controller: controller3,
                    validator: validator3,
                    hintText: 'Key (b)',
                    borderColor: Colors.white,
                    focusedBorderColor: kButtonColor2,
                    enabledBorderColor: Colors.white,
                    inputType: TextInputType.text,
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
          ],
        ),
      ),
    );
  }
}
