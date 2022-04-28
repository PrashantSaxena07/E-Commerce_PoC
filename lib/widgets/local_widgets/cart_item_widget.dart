import 'package:flutter/material.dart';
import 'package:foot_wear_v6001/constants/constants.dart';
import 'package:provider/provider.dart';

import '../../../providers/cart_provider.dart';

class CartItemWidget extends StatelessWidget {
  final String? id;
 final String? productId;
  final double? price;
  final int? quantity;
  final String? title;
  const CartItemWidget(
      {Key? key, this.price, this.quantity, this.title, this.id, this.productId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      ),
      onDismissed: (direction) {
        Provider.of<Cart>(context,listen: false).removeItem(productId);
      },
      direction: DismissDirection.endToStart,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2), color: ColorConstants.color3),
        child: ListTile(
          title: Text(title!),
          trailing: Text("x${quantity}"),
        ),
      ),
    );
  }
}
