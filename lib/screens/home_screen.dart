import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_shop/components/products_grid.dart';
import 'package:flutter_shop/providers/catalog_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static final screenName = '/products';

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
            CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                onPageChanged: null,
                scrollDirection: Axis.horizontal,
              ),
              items: catalog.products.map((product) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: Colors.amber),
                        child: Image.network(
                          product.imageUrl,
                          fit: BoxFit.cover,
                        ));
                  },
                );
              }).toList(),
            ),
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
