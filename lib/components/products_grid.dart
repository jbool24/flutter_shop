import 'package:flutter/material.dart';
import 'package:flutter_shop/screens/product_details_screen.dart';
import 'package:provider/provider.dart';

import 'package:flutter_shop/components/product_item.dart';
import 'package:flutter_shop/providers/catalog_provider.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final catalog = Provider.of<Catalog>(context);
    final products = catalog.products;

    void selectProduct(String productId) {
      Navigator.pushNamed(context, ProductDetailsScreen.screenName,
          arguments: productId);
    }

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, idx) => ChangeNotifierProvider.value(
        value: products[idx],
        child: GestureDetector(
          onTap: () => selectProduct(products[idx].id),
          child: ProductItem(),
        ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 30,
        crossAxisSpacing: 30,
      ),
    );
  }
}
