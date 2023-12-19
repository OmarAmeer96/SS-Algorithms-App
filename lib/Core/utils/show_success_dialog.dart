import 'package:flutter/material.dart';
import 'package:ss_algorithms_app/Core/utils/styles.dart';

void showSuccessDialog(
  BuildContext context,
  String text,
  String decodedData,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        title: Text(text),
        content: Text(
          decodedData,
          style: Styles.sFProDisplayBlack,
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
