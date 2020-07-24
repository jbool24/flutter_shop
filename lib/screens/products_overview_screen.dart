import 'package:flutter/material.dart';
import 'package:flutter_shop/components/products_grid.dart';
import 'package:flutter_shop/models/product.dart';

class ProductOverviewScreen extends StatelessWidget {
  static final screenName = '/products';
  final List<Product> loadedProducts;

  ProductOverviewScreen(this.loadedProducts);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
      ),
      body: ProductsGrid(loadedProducts: loadedProducts),
    );
  }
}
