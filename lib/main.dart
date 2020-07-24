import 'package:flutter/material.dart';
import 'package:flutter_shop/dummy_products.dart';
import 'package:flutter_shop/providers/catalog_provider.dart';
import 'package:flutter_shop/screens/products_overview_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Catalog(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: ProductOverviewScreen.screenName,
        routes: {
          ProductOverviewScreen.screenName: (ctx) =>
              ProductOverviewScreen(DUMMY_PRODUCTS),
        },
      ),
    );
  }
}
