import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  int id;
  String name;
  String image;
  double price;
  bool isFav;
  String decscription;

  Product(
      {required this.id,
        required this.name,
        required this.price,
        this.isFav = false,
        required this.image,
        required this.decscription});

  void toggleFavouriteStatus() {
    isFav = !isFav;
    notifyListeners();
  }
}
