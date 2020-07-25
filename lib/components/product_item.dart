import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/catalog_provider.dart';
import 'package:flutter_shop/providers/product.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);

    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
      ),
      child: GridTile(
        child: Image.network(
          product.imageUrl,
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          title: Text(
            product.title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          leading: Consumer<Product>(
            builder: (ctx, product, _) => IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
              color: Colors.red,
              onPressed: () => product.toggleFavorite(),
            ),
          ),
          trailing: Icon(Icons.shopping_cart),
          backgroundColor: Color.fromRGBO(0, 0, 0, 0.4),
        ),
      ),
    );
  }
}
