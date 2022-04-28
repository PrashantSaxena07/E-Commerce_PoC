import 'package:flutter/material.dart';
import 'package:foot_wear_v6001/constants/constants.dart';
import 'package:foot_wear_v6001/register/screen_signup.dart';

import '../widgets/item_elevatedbutton.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/onBoard.jpg'), fit: BoxFit.cover),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/shoes.png',
                  scale: 8,
                ),
                Text(
                  'Welcome to our Store',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text('Ger your footwears in as fast as one hour',
                    style: TextStyle(color: Colors.white, fontSize: 15)),
                MyElevatedButton(
                  width: 300,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Get Started',
                    style: TextStyle(color: ColorConstants.color1),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
