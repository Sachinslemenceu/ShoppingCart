import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    ["Avacado", "4.00", "assets/images/avacado.png", Colors.green],
    ["Banana", "12.00", "assets/images/banana.png", Colors.yellow],
    ["Strawberry", "10.00", "assets/images/stawberry.png", Colors.pink],
    ["Orange", "9.50", "assets/images/orange.png", Colors.orange],
  ];

  List _cartItems = [];

  get cartItems => _cartItems;

  get shopItems => _shopItems;

  void addItemCart(int i) {
    _cartItems.add(_shopItems[i]);
    notifyListeners();
  }

  void removeItemCart(int i) {
    _cartItems.removeAt(i);
    notifyListeners();
  }

  String calculatePrice() {
    double total = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      total += double.parse(_cartItems[i][1]);
    }
    return total.toStringAsFixed(2);
  }
}
