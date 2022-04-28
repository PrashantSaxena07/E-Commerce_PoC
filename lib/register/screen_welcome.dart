import 'package:flutter/material.dart';
import 'package:foot_wear_v6001/register/screen_signin.dart';
import 'package:foot_wear_v6001/register/screen_signup.dart';

import '../constants/constants.dart';
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://c0.wallpaperflare.com/preview/353/819/804/malaysia-ampang-524-converse.jpg"),
                  opacity: 01,
                  fit: BoxFit.cover),
            ),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              },
              child: Container(
                child: Center(
                  child: Text(
                    "SignIn",
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
                ),
                width: MediaQuery.of(context).size.width * 100,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                    color: ColorConstants.color1.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(40)),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
              child: Container(
                child: Center(
                  child: Text(
                    "SignUp",
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
                ),
                width: MediaQuery.of(context).size.width * 100,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                    color: ColorConstants.color1.withOpacity(0.5),

                    borderRadius: BorderRadius.circular(40)),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
