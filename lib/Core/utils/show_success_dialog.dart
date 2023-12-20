import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          IconButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: decodedData));
              Navigator.of(context).pop();
              Flushbar(
                icon: const Icon(Icons.check),
                message: "Copied to clipboard",
                duration: const Duration(seconds: 2),
                flushbarPosition: FlushbarPosition.BOTTOM,
              ).show(context);
            },
            icon: const Icon(Icons.copy),
          ),
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
