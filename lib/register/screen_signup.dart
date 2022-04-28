import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foot_wear_v6001/register/screen_signin.dart';
import 'package:foot_wear_v6001/register/state/curent_user.dart';
import 'package:foot_wear_v6001/screens/home_page.dart';
import 'package:foot_wear_v6001/widgets/item_elevatedbutton.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController _nameController = new TextEditingController();

  TextEditingController _emailController = new TextEditingController();

  TextEditingController _passwordController = new TextEditingController();

  bool isEmailValid(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern.toString());
    return regex.hasMatch(email);
  }

  bool isPasswordValid(String password) => password.length >= 6;

  _validateData() {
    if (formGlobalKey.currentState!.validate()) {
      _signUpUser(_emailController.text, _passwordController.text,_nameController.text);
      Text("saved");
    } else {
      Text("not");
    }
  }

  void _signUpUser(String email, String password,String userName) async {
    CurrentUser _currentuser = Provider.of<CurrentUser>(context, listen: false);

    try {
      String _returnstring=await _currentuser.signUpUser(email, password,userName);
      if (_returnstring=="success") {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>HomePage()),(route)=>false);
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(_returnstring),
          duration: Duration(seconds: 2),
        ));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          color: ColorConstants.color1,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "SignUp",
          style: TextStyle(
              color: ColorConstants.color1, fontWeight: FontWeight.w800),
        ),
        elevation: 0,
        backgroundColor: Color.fromRGBO(215, 78, 68, 1),
      ),
      body: Builder(
        builder: (context) => Container(
          color: Color.fromRGBO(215, 78, 68, 1),
          child: SingleChildScrollView(
            child: Form(
              key: formGlobalKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 14, right: 14, bottom: 10),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: Container(
                          height: size.height * 0.4,
                          width: size.width * 1,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/shoeanim.gif"))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25.0),
                        child: MyElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignInScreen()));
                            },
                            borderRadius: BorderRadius.circular(15),
                            child: Text(
                              'Already Signed Up?  SignIn',
                              style: TextStyle(color: ColorConstants.color1),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text(
                          "Create your profile",
                          style: TextStyle(
                              color: ColorConstants.color1,
                              fontWeight: FontWeight.w800,
                              fontSize: 25),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: ColorConstants.color4),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              TextField(
                                controller: _nameController,
                                decoration: InputDecoration(
                                  hintText: "username",
                                  prefixIcon: Icon(Icons.person),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              TextFormField(
                                validator: (email) {
                                  if (isEmailValid(email!))
                                    return null;
                                  else
                                    return 'Enter a valid email address';
                                },
                                controller: _emailController,
                                decoration: InputDecoration(
                                  hintText: "email",
                                  prefixIcon: Icon(Icons.email),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              TextFormField(
                                validator: (password) {
                                  if (isPasswordValid(password!))
                                    return null;
                                  else
                                    return 'Enter a valid password';
                                },
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  hintText: "password",
                                  prefixIcon: Icon(Icons.key),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.04,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _validateData();
                                },
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      "SignUp",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  width: size.width * 0.5,
                                  height: size.height * 0.06,
                                  decoration: BoxDecoration(
                                      color: ColorConstants.color1,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
