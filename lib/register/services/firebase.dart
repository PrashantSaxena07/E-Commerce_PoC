import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/user.dart';

class OurDatabase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> createUser(UserData user) async {
    String retval = "error";

    try {
      await _firestore.collection("users").doc(user.uid).set({
        'userName': user.userName,
        "email": user.email,
        "accountCreated": Timestamp.now(),
      });
      retval = "success";
    } catch (e) {
      print(e);
    }
    return retval;
  }

  Future<UserData> getUser(String uid) async {
    UserData retVal = UserData();

    try {
      DocumentSnapshot _docSnashot =
          await _firestore.collection("users").doc(uid).get();

      retVal.uid = uid;

      retVal.userName = _docSnashot.get('userName');
      retVal.userName = _docSnashot.get('email');
      retVal.userName = _docSnashot.get('accountCreated');
    } catch (e) {
      print(e);
    }
    return retVal;
  }
}
