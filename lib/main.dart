import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/catalog_provider.dart';
import 'package:flutter_shop/screens/home_screen.dart';
import 'package:flutter_shop/screens/product_details_screen.dart';
import 'package:flutter_shop/screens/products_overview_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Catalog(),
      child: MaterialApp(
        title: 'Flutter Shop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
        routes: {
          ProductOverviewScreen.screenName: (ctx) => ProductOverviewScreen(),
          ProductDetailsScreen.screenName: (ctx) => ProductDetailsScreen(),
        },
      ),
    );
  }
}
