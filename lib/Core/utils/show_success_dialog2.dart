import 'package:flutter/material.dart';
import 'package:ss_algorithms_app/Core/utils/edit_profile_button.dart';
import 'package:ss_algorithms_app/constants.dart';

void showLogoutConfirmationDialog(
    BuildContext context, VoidCallback onYesPressed) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        title: const Text(
          "IP Successfully Changed",
        ),
        actions: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                EditProfileButton(
                  text: 'Ok',
                  onPressed: () {
                    onYesPressed();
                    // GoRouter.of(context).push(AppRouter.kLoginView);
                  },
                  color: kButtonColor2,
                ),
                EditProfileButton(
                  text: 'Undo',
                  textColor: Colors.black,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: kPrimaryColor,
                ),
              ],
            ),
          )
        ],
      );
    },
  );
}
