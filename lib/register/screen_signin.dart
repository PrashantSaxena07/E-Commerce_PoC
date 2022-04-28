import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foot_wear_v6001/register/state/curent_user.dart';
import 'package:foot_wear_v6001/screens/home_page.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';

enum LoginType { email, google }

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late CurrentUser _currentuser;

  @override
  void initState() {
    super.initState();
     _currentuser = Provider.of<CurrentUser>(context, listen: false);
  }

  final formGlobalKey = GlobalKey<FormState>();

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
      _loginUser(
          type: LoginType.email,
          email: _emailController.text,
          password: _passwordController.text);
      Text("saved");
    } else {
      Text("not");
    }
  }

  void _loginUser(
      {required LoginType type, String? email, String? password}) async {


    try {
      String _returnString = "";
      switch (type) {
        case LoginType.email:
          _returnString =
          await _currentuser.loginUserWithEmail(email!, password!);
          break;
        case LoginType.google:
          _returnString = await _currentuser.loginUserWithGoogle();
          break;

        default:
      }

      if (_returnString == "success") {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
                (route) => false);
      } else {


        // Scaffold.of(context).showSnackBar(SnackBar(
        //   content: Text(_returnString),
        //   duration: Duration(seconds: 2),
        // ));
        Fluttertoast.showToast(
            msg: _returnString,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: ColorConstants.color3,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Widget _googleButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        _loginUser(type: LoginType.google);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: ColorConstants.color1),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
                image: AssetImage("assets/google.png"),
                height: 25.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: ColorConstants.color1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "SignIn",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w800, letterSpacing: 2),
        ),
        elevation: 0,
        backgroundColor: ColorConstants.color1,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formGlobalKey,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: size.height * 0.4,
                    height: size.width * 0.6,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                            AssetImage("assets/shoes.png")
                        )
                    ),
                  ),
                ),
                Text(
                  "Login Here",
                  style: TextStyle(
                      color: ColorConstants.color1,
                      fontWeight: FontWeight.w800,
                      fontSize: 25),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ColorConstants.color4),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        TextFormField(
                          cursorColor: ColorConstants.color3,

                          validator: (email) {
                            if (isEmailValid(email!))
                              return null;
                            else
                              return 'Enter a valid email address';
                          },
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: "email",
                            prefixIconColor: ColorConstants.color3,
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        TextFormField(
                          cursorColor: ColorConstants.color3,
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
                                "SignIn",
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
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        // Row(children: [
                        //   Divider(
                        //     indent: 5,
                        //     thickness: 2,
                        //   ),
                        //   Text(
                        //     "OR",
                        //     style: TextStyle(
                        //         color: ColorConstants.color1,
                        //         fontWeight: FontWeight.w700,
                        //         fontSize: 20),
                        //   ),
                        //   Divider(endIndent: 5,)
                        // ],),
                        Text(
                          "OR",
                          style: TextStyle(
                              color: ColorConstants.color1,
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        _googleButton()
                      ],
                    ),
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
