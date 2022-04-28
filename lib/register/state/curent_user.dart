import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foot_wear_v6001/constants/constants.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../model/user.dart';
import '../services/firebase.dart';

class CurrentUser extends ChangeNotifier {
  UserData _currentUser = UserData();
  UserData get getCurrentUser => _currentUser;
//auth instance
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> onStartUp() async {
    String retVal = "error";

    try {
      User? _firebaseuser = await _auth.currentUser;
      if (_firebaseuser != null) {
        _currentUser = await OurDatabase().getUser(_firebaseuser.uid);

        if (_currentUser != null) {
          retVal = "success";
        }
      }
    } catch (e) {
      print(e);
    }
    return retVal;
  }

//sign out
  Future<String> signOut() async {
    String retval = "error";

    try {
      await _auth.signOut();
      _currentUser = UserData();
      retval = "success";
    } catch (e) {
      print(e);
    }
    return retval;
  }

  Future<String> signUpUser(
      String email, String password, String username) async {
    String retVal = "error";
    UserData _user = new UserData();

    try {
      UserCredential _authresult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _user.uid = _authresult.user?.uid;
      _user.email = _authresult.user?.email;
      _user.userName = username;
      _user.profileImage =
      "https://www.pngkit.com/png/full/72-729613_icons-logos-emojis-user-icon-png-transparent.png";

      String _returnstring = await OurDatabase().createUser(_user);
      if (_returnstring == "success") {
        Fluttertoast.showToast(
            msg: "Successfully signed Up !",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: ColorConstants.color2,
            textColor: Colors.white,
            fontSize: 16.0);
        retVal = "success";
      }
    } catch (exc) {
      retVal = exc.toString();
    }

    return retVal;
  }
  Future<String> loginUserWithEmail(String email, String password) async {
    String retVal = "error";

    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      _currentUser = await OurDatabase().getUser(_authResult.user!.uid);

      if (_currentUser != null) {
        retVal = "success";
      }
    } catch (e) {
      retVal = e.toString();
    }

    return retVal;
  }

  Future<String> loginUserWithGoogle() async {
    String retVal = "error";
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );

    UserData _user = UserData();

    try {
      GoogleSignInAccount? _googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication _googleAuth =
          await _googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: _googleAuth.idToken, accessToken: _googleAuth.accessToken);
      UserCredential _authResult = await _auth.signInWithCredential(credential);

      if (_authResult.additionalUserInfo!.isNewUser) {
        _user.uid = _authResult.user?.uid;
        _user.email = _authResult.user?.email;
        _user.userName = _authResult.user?.displayName;
        _user.profileImage =
        "https://www.pngkit.com/png/full/72-729613_icons-logos-emojis-user-icon-png-transparent.png";
        OurDatabase().createUser(_user);
      }


      _currentUser = await OurDatabase().getUser(_authResult.user!.uid);

      if (_currentUser != null) {
        retVal = "success";
      }
    } catch (e) {
      print(e);
    }

    return retVal;
  }
}
