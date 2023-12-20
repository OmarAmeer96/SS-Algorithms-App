import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ss_algorithms_app/Core/utils/app_state.dart';
import 'package:ss_algorithms_app/Core/utils/show_success_dialog2.dart';
import 'package:ss_algorithms_app/Core/utils/styles.dart';
import 'package:ss_algorithms_app/Core/widgets/custom_main_button.dart';
import 'package:ss_algorithms_app/Core/widgets/custom_main_text_field.dart';
import 'package:ss_algorithms_app/constants.dart';

class ChangeIpViewBody extends StatefulWidget {
  const ChangeIpViewBody({super.key});

  @override
  State<ChangeIpViewBody> createState() => _ChangeIpViewBodyState();
}

class _ChangeIpViewBodyState extends State<ChangeIpViewBody> {
  String? inputIp;

  final _inputIpController = TextEditingController();

  final _ipForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context, listen: false);
    return SafeArea(
      child: Form(
        key: _ipForm,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Change IP',
                    style: Styles.sFProDisplayBold.copyWith(),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomMainTextField(
                  hintText: "Enter New IP",
                  borderColor: kButtonColor1,
                  focusedBorderColor: kButtonColor2,
                  enabledBorderColor: Colors.white,
                  inputType: TextInputType.text,
                  obscureText: false,
                  controller: _inputIpController,
                  onChanged: (data) {
                    inputIp = data;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a value.';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomMainButton(
                  text: "Submit",
                  onPressed: () {
                    if (_ipForm.currentState!.validate()) {
                      showLogoutConfirmationDialog(
                        context,
                        () {
                          appState.updateBaseUrl(inputIp!);
                          Navigator.of(context).pop();
                        },
                      );
                    }
                  },
                  color: kButtonColor2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
