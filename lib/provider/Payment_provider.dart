import 'package:flutter/foundation.dart';

class PaymentProvider extends ChangeNotifier {
  int _quantity = 1;

  int get quantity => _quantity;

  void increment() {
    _quantity++;
    notifyListeners();
  }

  void decrement() {
    if (_quantity > 0) {
      _quantity--;
      notifyListeners();
    }
  }

  double calculateTotal(double itemPrice) {
    return itemPrice * _quantity;
  }
}
