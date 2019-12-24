import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_app/providers/orders.provider.dart' show Orders;
import 'package:shop_app/widgets/app_drawer.widget.dart';
import 'package:shop_app/widgets/order_item.widget.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Orders')),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (dataSnapshot.error != null) {
            return Text('error');
          } else {
            return Consumer<Orders>(
              builder: (ctx, orderData, child) => ListView.builder(
                itemCount: orderData.orders.length,
                itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
              ),
            );
          }
        },
      ),
    );
  }
}
