import 'dart:async';
import 'package:flutter/material.dart';
import 'package:foot_wear_v6001/constants/constants.dart';
import 'package:foot_wear_v6001/register/screen_onboarding.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(builder: (_) => OnBoardScreen()));
    });
    return Scaffold(
      body: Container(
        color: ColorConstants.color1,
        child: Center(
          child: ListTile(
            leading: Image.asset('assets/shoes.png', scale: 1,),
            title: Text('footwear', style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold, fontSize: 55, letterSpacing:2),),
            subtitle: Text('online footwear', style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15, letterSpacing:8)),
          ),
        ),
      ),
    );
  }
}
