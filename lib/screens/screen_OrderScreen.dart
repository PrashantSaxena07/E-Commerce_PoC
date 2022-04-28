import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../providers/orders_provider.dart';
import '../widgets/local_widgets/ordered_item.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConstants.color1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorConstants.color3,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text(
          "Your Orders",
          style: TextStyle(color: ColorConstants.color3),
        ),
      ),
      body: ListView.builder(
          itemCount: orderData.orders.length,
          itemBuilder: (context, index) =>
              OrderedItem(order: orderData.orders[index])),
    );
  }
}
