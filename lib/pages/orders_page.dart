import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/order.dart';
import 'package:shop/models/order_list.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> refreshProducts(BuildContext context) {
      return Provider.of<OrderList>(
        context,
        listen: false,
      ).loadOrders();
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Meus Pedidos'),
        ),
        drawer: const AppDrawer(),
        body: RefreshIndicator(
          onRefresh: () => refreshProducts(context),
          child: FutureBuilder(
            future: Provider.of<OrderList>(context, listen: false).loadOrders(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Consumer<OrderList>(
                  builder: (context, orders, child) => ListView.builder(
                    itemCount: orders.itemsCount,
                    itemBuilder: (ctx, i) =>
                        OrderWidget(order: orders.items[i]),
                  ),
                );
              }
            },
          ),
        ));
  }
}
