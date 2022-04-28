import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foot_wear_v6001/constants/constants.dart';
import 'package:foot_wear_v6001/screens/home_page.dart';

class SuccessfullyPlacedOrder extends StatefulWidget {




  const SuccessfullyPlacedOrder({Key? key}) : super(key: key);

  @override
  State<SuccessfullyPlacedOrder> createState() => _SuccessfullyPlacedOrderState();
}

class _SuccessfullyPlacedOrderState extends State<SuccessfullyPlacedOrder> {

  @override
  void initState() {

    super.initState();
    startTime();
  }


  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => HomePage()
    )
    );
  }

  @override
  Widget build(BuildContext context) {


    // return Scaffold(
    //
    //   body: Center(
    //     child: Column(
    //
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //
    //         children:[
    //           Image.asset("assets/check_tick.webp", color: ColorConstants.color3,),
    //           Text("Order Successfully Placed", style: TextStyle(fontSize: 25, letterSpacing: 2.5, color: ColorConstants.color3),)
    //         ]
    //
    //     ),
    //   ),
    // );


    return Container(
      padding: EdgeInsets.all(10),
      height: 400,
      width: 400,

      child: Column(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children:[
                    Image.asset("assets/check_tick.webp", color: ColorConstants.color3,),
                    Text("Order Successfully Placed", style: TextStyle(fontSize: 18, letterSpacing: 2, color: ColorConstants.color3),)
                  ]

              ),
    );


  }
}
