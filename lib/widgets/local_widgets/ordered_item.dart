import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../providers/orders_provider.dart';
import '../../constants/constants.dart';

class OrderedItem extends StatefulWidget {

  final OrderItem order;
  const OrderedItem({Key? key, required this.order}) : super(key: key);

  @override
  State<OrderedItem> createState() => _OrderedItemState();
}

class _OrderedItemState extends State<OrderedItem> {

  var expanded=false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorConstants.color3.withOpacity(0.9),

      margin: EdgeInsets.all(10),child: Column(
      children: [

        ListTile(

          title: Text('\$${widget.order.amount}'),
          subtitle: Text(DateFormat('dd MM yyyy hh:mm').format(widget.order.dateTime)),

          trailing: IconButton(icon: Icon(expanded?Icons.expand_less:Icons.expand_more, color: ColorConstants.color1,), onPressed: () {

            setState(() {
              expanded=!expanded;

            });


          },),
        ),

        if(expanded)
          Container(
            color: ColorConstants.color3,
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
            height: min(widget.order.products.length*20.0+10,100),

            child: ListView(
              children: widget.order.products.map((prod) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(prod.title,style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),),
                  Text('${prod.quantity}x \$${prod.price}',style: TextStyle(
                    fontSize: 18,
                    color:Colors.grey
                  ),)
                ],
              )
    ).toList()
            ),
          )

      ],
    ),
    );
  }
}
