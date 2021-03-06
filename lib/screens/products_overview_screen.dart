import 'package:flutter/material.dart';
import 'package:flutter_shop/components/products_grid.dart';
import 'package:flutter_shop/providers/catalog_provider.dart';
import 'package:provider/provider.dart';

class ProductOverviewScreen extends StatefulWidget {
  static final screenName = '/products';

  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    final catalog = Provider.of<Catalog>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog'),
        actions: <Widget>[
          PopupMenuButton(
            onCanceled: null,
            onSelected: (FilterOptions option) {
              if (option == FilterOptions.favorites) {
                catalog.setFilter(FilterOptions.favorites);
              } else {
                catalog.setFilter(FilterOptions.all);
              }
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.all,
              )
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Text(
              'Featured Products',
              style: TextStyle(fontSize: 24),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Divider(
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(height: 600, child: ProductsGrid()),
          ],
        ),
      ),
    );
  }
}
