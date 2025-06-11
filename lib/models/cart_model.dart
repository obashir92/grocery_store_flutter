import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {

  // List of items on sale
  final List _shopItems = [
    ["Cookies", "5.00", "lib/images/cookies.svg", Colors.green],
    ["Bananas", "4.00", "lib/images/bananas.svg", Colors.yellow],
    ["Chicken", "10.00", "lib/images/chicken.svg", Colors.brown],
    ["Water", "3.00", "lib/images/water.svg", Colors.blue],
    ["Water Melon", "7.00", "lib/images/watermelon.svg", Colors.pink],
  ];

  // List of items in the cart
  final List _cartItems = [];

  get shopItems => _shopItems;

  get cartItems => _cartItems;

  // Method to add an item to the cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }
  // Method to remove an item from the cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // Method to calculate the total price of the cart
  String calculateTotal(){
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}