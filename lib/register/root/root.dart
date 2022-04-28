import 'package:flutter/material.dart';
import 'package:foot_wear_v6001/register/screen_onboarding.dart';
import 'package:foot_wear_v6001/screens/home_page.dart';
import 'package:provider/provider.dart';

import '../state/curent_user.dart';

enum AuthStatus{
  notLoggedIn,
  loggedIn
}

class OurRoot extends StatefulWidget {
  const OurRoot({Key? key}) : super(key: key);

  @override
  State<OurRoot> createState() => _OurRootState();
}

class _OurRootState extends State<OurRoot> {


  AuthStatus _authStatus=AuthStatus.notLoggedIn;

  @override
  void didChangeDependencies()async {

    super.didChangeDependencies();

    CurrentUser _currentUser=Provider.of<CurrentUser>(context,listen: false);

    String _returnString=await _currentUser.onStartUp();

    if(_returnString=="success"){
      setState(() {

        _authStatus=AuthStatus.loggedIn;
      });
    }
  }
  @override
  Widget build(BuildContext context) {

    Widget retVal;

    switch(_authStatus){
      case AuthStatus.notLoggedIn:
        retVal=OnBoardScreen();
        break;

      case AuthStatus.loggedIn:
        retVal=HomePage();
        break;

    }
    return retVal;
  }
}
