import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int _counter = 0;
  bool _showLoginButton = false;

  int get counter => _counter;
  bool get showLoginButton => _showLoginButton;

  void incrementCounter() {
    _counter++;
    if (_counter >= 3) {
      _showLoginButton = true;
    }
    notifyListeners();
  }

  void setShowLoginButton(bool value) {
    _showLoginButton = value;
    notifyListeners();
  }
}
