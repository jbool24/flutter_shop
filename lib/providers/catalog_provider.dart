import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/dummy_products.dart';
import 'package:flutter_shop/providers/product.dart';

enum FilterOptions {
  favorites,
  all,
}

class Catalog with ChangeNotifier {
  List<Product> _products = [...DUMMY_PRODUCTS];
  FilterOptions productFilter;
  var useFilter = false;

  List<Product> get products {
    if (useFilter)
      return _products.where((product) => product.isFavorite).toList();
    return [..._products];
  }

  Product findById(String productId) {
    return products.firstWhere((product) => product.id == productId);
  }

  void setFilter(FilterOptions filter) {
    if (filter == FilterOptions.favorites) {
      productFilter = filter;
      useFilter = true;
    } else {
      useFilter = false;
    }
    notifyListeners();
  }

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }
}
