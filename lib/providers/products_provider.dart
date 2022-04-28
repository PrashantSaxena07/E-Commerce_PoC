import 'package:flutter/material.dart';

import '../model/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 1,
      name: 'Shoe 1',
      price: 240.00,
      image:'https://cdn-icons-png.flaticon.com/512/925/925667.png',
      decscription:'It is pretty pair!',
    ),
    Product(
      id: 2,
      name: 'Shoe 2',
      price: 29.99,
      image:'https://cdn-icons-png.flaticon.com/512/2721/2721370.png',
      decscription: 'It is pretty pair!',

    ),
    Product(
      id: 3,
      name: 'shoe 3',
      price: 240.00,
      image:'https://cdn-icons-png.flaticon.com/512/289/289007.png',
      decscription: 'It is pretty pair!',
    ),
    Product(
      id: 4,
      name: 'shoe 4',
      price: 240.00,
      image:
      'https://cdn-icons-png.flaticon.com/512/431/431418.png',
      decscription: 'It is pretty pair!',
    ),
    Product(
      id: 5,
      name: 'Shoe 5',
      price: 240.00,
      image:'https://cdn-icons-png.flaticon.com/512/925/925667.png',
      decscription:'It is pretty pair!',
    ),
    Product(
      id: 6,
      name: 'Shoe 6',
      price: 29.99,
      image:'https://cdn-icons-png.flaticon.com/512/2721/2721370.png',
      decscription: 'It is pretty pair!',

    ),
    Product(
      id: 7,
      name: 'shoe 7',
      price: 240.00,
      image:'https://cdn-icons-png.flaticon.com/512/289/289007.png',
      decscription: 'It is pretty pair!',
    ),
    Product(
      id: 8,
      name: 'shoe 8',
      price: 240.00,
      image:
      'https://cdn-icons-png.flaticon.com/512/431/431418.png',
      decscription: 'It is pretty pair!',
    ),
    Product(
      id: 9,
      name: 'Shoe 9',
      price: 240.00,
      image:'https://cdn-icons-png.flaticon.com/512/925/925667.png',
      decscription:'It is pretty pair!',
    ),
    Product(
      id: 10,
      name: 'Shoe 10',
      price: 29.99,
      image:'https://cdn-icons-png.flaticon.com/512/2721/2721370.png',
      decscription: 'It is pretty pair!',

    ),
    Product(
      id: 11,
      name: 'shoe 11',
      price: 240.00,
      image:'https://cdn-icons-png.flaticon.com/512/289/289007.png',
      decscription: 'It is pretty pair!',
    ),
    Product(
      id: 12,
      name: 'shoe 12',
      price: 240.00,
      image:
      'https://cdn-icons-png.flaticon.com/512/431/431418.png',
      decscription: 'It is pretty pair!',
    ),
    Product(
      id: 13,
      name: 'Shoe 13',
      price: 240.00,
      image:'https://cdn-icons-png.flaticon.com/512/925/925667.png',
      decscription:'It is pretty pair!',
    ),
    Product(
      id: 14,
      name: 'Shoe 14',
      price: 29.99,
      image:'https://cdn-icons-png.flaticon.com/512/2721/2721370.png',
      decscription: 'It is pretty pair!',

    ),
    Product(
      id: 15,
      name: 'shoe 15',
      price: 240.00,
      image:'https://cdn-icons-png.flaticon.com/512/289/289007.png',
      decscription: 'It is pretty pair!',
    ),
    Product(
      id: 16,
      name: 'shoe 16',
      price: 240.00,
      image:
      'https://cdn-icons-png.flaticon.com/512/431/431418.png',
      decscription: 'It is pretty pair!',
    ),
    Product(
      id: 17,
      name: 'Shoe 17',
      price: 240.00,
      image:'https://cdn-icons-png.flaticon.com/512/925/925667.png',
      decscription:'It is pretty pair!',
    ),
    Product(
      id: 18,
      name: 'Shoe 18',
      price: 29.99,
      image:'https://cdn-icons-png.flaticon.com/512/2721/2721370.png',
      decscription: 'It is pretty pair!',

    ),
    Product(
      id: 19,
      name: 'shoe 19',
      price: 240.00,
      image:'https://cdn-icons-png.flaticon.com/512/289/289007.png',
      decscription: 'It is pretty pair!',
    ),
    Product(
      id: 20,
      name: 'shoe 20',
      price: 240.00,
      image:
      'https://cdn-icons-png.flaticon.com/512/431/431418.png',
      decscription: 'It is pretty pair!',
    ),



  ];

  List<Product> get items {
    return [..._items];
  }

  // void addProduct() {
  //   // _items.add(value);
  //   notifyListeners();
  // }
  Product findById(int id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  List<Product> get favItems {
    return _items.where((prodItem) => prodItem.isFav).toList();
  }
}
