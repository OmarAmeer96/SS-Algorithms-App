import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  String _baseUrl = 'https://mohammedsamy.pythonanywhere.com/';
  // Old One: http://10.0.2.2:5000

  String get baseUrl => _baseUrl;

  void updateBaseUrl(String newUrl) {
    _baseUrl = newUrl;
    notifyListeners();
  }
}
