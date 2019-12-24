import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.provider.dart';
import 'package:shop_app/providers/orders.provider.dart';

import 'package:shop_app/providers/products.provider.dart';
import 'package:shop_app/screens/auth.screen.dart';
import 'package:shop_app/screens/cart.screen.dart';
import 'package:shop_app/screens/edit_product.screen.dart';
import 'package:shop_app/screens/orders.screen.dart';
import 'package:shop_app/screens/product_detail.screen.dart';
import 'package:shop_app/screens/products_overview.screen.dart';
import 'package:shop_app/screens/user_products.screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: AuthScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
          UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
          EditProductScreen.routeName: (ctx) => EditProductScreen(),
        },
      ),
    );
  }
}
