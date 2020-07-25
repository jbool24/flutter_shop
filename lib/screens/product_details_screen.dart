import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/catalog_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  static final screenName = '/product-details';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments;
    final product = Provider.of<Catalog>(context).findById(productId);
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        // decoration: BoxDecoration(color: Colors.amber),
        child: Column(
          children: [
            Text(
              product.title,
              style: Theme.of(context).textTheme.headline3,
            ),
            Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
            Text(
              "\$${product.price.toString()}",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
