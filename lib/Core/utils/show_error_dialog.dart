import 'package:flutter/material.dart';
import 'package:ss_algorithms_app/Core/utils/styles.dart';

void showErrorDialog(
  BuildContext context,
  String errorText,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        title: const Text("Error"),
        content: Text(
          errorText,
          style: Styles.sFProDisplayBlack.copyWith(
            fontSize: 12,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
