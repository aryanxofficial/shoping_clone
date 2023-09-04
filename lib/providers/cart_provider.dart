import 'package:flutter/material.dart';

// now things I define in this class can be used outside this class and basically anywhere since I m using this inside a provider.
class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];

  void addProduct(Map<String, dynamic> product) {
    cart.add(product);
    notifyListeners();//changeNotifier does not do anything automatically, I have to use this function to actually make the changes happen
  }

  void removeProduct(Map<String, dynamic> product) {
    cart.remove(product);
    notifyListeners();
  }
}
