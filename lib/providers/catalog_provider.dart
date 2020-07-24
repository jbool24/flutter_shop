import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/models/product.dart';

class Catalog with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products {
    return [..._products];
  }

  addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }
}
