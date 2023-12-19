import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  String _baseUrl = 'http://10.0.2.2:5000';
  // One: http://10.0.2.2:5000
  // Two: https://mohammedsamy.pythonanywhere.com/

  String get baseUrl => _baseUrl;

  void updateBaseUrl(String newUrl) {
    _baseUrl = newUrl;
    notifyListeners();
  }
}
