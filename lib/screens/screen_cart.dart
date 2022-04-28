import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../providers/cart_provider.dart';
import '../providers/orders_provider.dart';
import '../widgets/card_SuccessfullySaved.dart';
import '../widgets/local_widgets/cart_item_widget.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:
          Icon(Icons.arrow_back_ios_rounded, color: ColorConstants.color3),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text(
          "Your Cart",
          style: TextStyle(color: ColorConstants.color3),
        ),
        backgroundColor: ColorConstants.color1,
        elevation: 0,
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (context, index) => CartItemWidget(
                  id: cart.items.values.toList()[index].id,
                  productId: cart.items.keys.toList()[index],
                  price: cart.items.values.toList()[index].price,
                  title: cart.items.values.toList()[index].title,
                  quantity: cart.items.values.toList()[index].quantity)),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                Provider.of<Orders>(context,listen: false)
                    .addOrder(cart.items.values.toList(), cart.totalAmount);
                print("hello");

                cart.clear();
                showDialog(context: context, builder: (context) =>
                    SimpleDialog(
                      elevation: 5,
                      backgroundColor: ColorConstants.color1.withOpacity(0.7),
                      children: <Widget>[
                        SuccessfullyPlacedOrder()
                      ],
                    ),);
                // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>SuccessfullyPlacedOrder()));
              },
              child: Container(
                width: size.width,
                height: size.height * 0.1,
                decoration: BoxDecoration(
                  color: ColorConstants.color2,
                ),
                child: Center(
                    child: Text(
                      "Place Order (Total Amount ${cart.totalAmount})",
                      style: TextStyle(
                          color: ColorConstants.color1, fontWeight: FontWeight.w700),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
