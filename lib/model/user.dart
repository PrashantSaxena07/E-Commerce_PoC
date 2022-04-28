import 'package:cloud_firestore/cloud_firestore.dart';

class UserData{
  late String? uid;
  late String? email;
  late String? userName;
  late Timestamp? accountCreated;
  late String? profileImage;

  UserData({ this.uid, this.email, this.userName, this.accountCreated,this.profileImage});
}