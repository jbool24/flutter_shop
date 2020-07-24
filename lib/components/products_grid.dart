import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_shop/components/product_item.dart';
import 'package:flutter_shop/providers/catalog_provider.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final catalog = Provider.of<Catalog>(context);
    final products = catalog.products;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, idx) => ProductItem(
        products[idx].id,
        products[idx].title,
        products[idx].imageUrl,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
    );
  }
}
