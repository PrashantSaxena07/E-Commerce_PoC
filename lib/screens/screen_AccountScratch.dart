import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foot_wear_v6001/constants/constants.dart';
import 'package:foot_wear_v6001/constants/localization/language_button.dart';
import 'package:foot_wear_v6001/constants/theme/buttton_theme.dart';
import 'package:foot_wear_v6001/register/screen_onboarding.dart';
import 'package:foot_wear_v6001/screens/screen_OrderScreen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../register/state/curent_user.dart';
import '../widgets/item_elevatedbutton.dart';
import '../widgets/item_options.dart';

enum Language { English, French }

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  int _langGroup = -1;
  var _currentIndex = 0;
  FirebaseAuth _auth = FirebaseAuth.instance;
  String userName = "";
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late File? imagePath = null;
  late Stream myStream;

  storeProfilePic() async {
    var firebaseUser = await FirebaseAuth.instance.currentUser;

    String downloadPic = imagePath == null
        ? "https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-photo-183042379.jpg"
        : await uploadImage();
    FirebaseFirestore.instance.collection('users').doc(firebaseUser?.uid).set({
      'profileImage': downloadPic,
    }, SetOptions(merge: true));
  }

  // pickImage(ImageSource imageSource) async {
  //   final image = await ImagePicker()
  //       .pickImage(source: imageSource, maxHeight: 670, maxWidth: 800);
  //   setState(() {
  //     imagePath = File(image!.path);
  //   });
  //
  //   Navigator.pop(context);
  // }

  uploadImage() async {
    var firebaseUser = await FirebaseAuth.instance.currentUser;

    UploadTask uploadTask;
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('users')
        .child(firebaseUser!.uid)
        .child(imagePath!.path.toString());

    uploadTask = ref.putFile(File(imagePath!.path));

    // final Reference firebaseStorageRef =
    //     FirebaseStorage.instance.ref().child("users").child(firebaseUser!.uid);
    // firebaseStorageRef.putFile(imagePath);

    // UploadTask uploadTask = firebaseStorageRef.putFile(imagePath);

    // var downloadPic = firebaseStorageRef.getDownloadURL();
    // print("pic$downloadPic");
    // // final UploadTask task =
    // firebaseStorageRef.putFile(imagePath);

    // Waits till the file is uploaded then stores the download url
    String downloadPic = ref.getDownloadURL() as String;
    return downloadPic;
  }

  @override
  void initState() {
    getuserInfo();

    super.initState();
  }

  _imgFromGallery() async {
    final image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, maxHeight: 670, maxWidth: 800);
    if (image != null) {
      setState(() => imagePath = File(image.path));
    }
    storeProfilePic();

    print('imagePath = $imagePath');
    Navigator.of(context).pop();
  }

  _imgFromCamera() async {
    final image = await ImagePicker()
        .pickImage(source: ImageSource.camera, maxHeight: 670, maxWidth: 800);
    if (image != null) {
      setState(() => imagePath = File(image.path));
    }
    storeProfilePic();
    print('imagePath = $imagePath');
    Navigator.of(context).pop();
  }

  _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Choose Profile Pic",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                ListTile(
                    leading: new Icon(Icons.photo_library),
                    title: new Text('Gallery'),
                    onTap: () {
                      _imgFromGallery();
                    }),
                ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text('Camera'),
                  onTap: () {
                    _imgFromCamera();
                  },
                ),
              ],
            ),
          );
        });
  }

  Future getuserInfo() async {
    DocumentSnapshot _docSnashot =
        await _firestore.collection("users").doc(_auth.currentUser?.uid).get();
    userName = _docSnashot.get('userName');
    print(userName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            children: [
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: imagePath != null
                      ? Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200],
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 0),
                                  color: Colors.grey,
                                  blurRadius: 10,
                                  spreadRadius: 10)
                            ],
                          ),
                          child: CircleAvatar(
                              radius: 50, backgroundImage: FileImage(imagePath!)

                              // FileImage(
                              //   imagePath==null?
                              //     imagePath
                              //   // snapshot.data['profileImage'] ==
                              //   //
                              //   //     ? 'https://www.pngkit.com/png/full/72-729613_icons-logos-emojis-user-icon-png-transparent.png'
                              //   //     : snapshot.data['profileImage'],
                              // ),
                              ),
                        )
                      : GestureDetector(
                          onTap: () => _showPicker(context),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[200],
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 0),
                                    color: Colors.grey,
                                    blurRadius: 10,
                                    spreadRadius: 10)
                              ],
                            ),
                            child: CircleAvatar(
                              radius: 50,

                              // FileImage(
                              //   imagePath==null?
                              //     imagePath
                              //   // snapshot.data['profileImage'] ==
                              //   //
                              //   //     ? 'https://www.pngkit.com/png/full/72-729613_icons-logos-emojis-user-icon-png-transparent.png'
                              //   //     : snapshot.data['profileImage'],
                              // ),
                            ),
                          ),
                        )),
              Positioned(
                  top: 70,
                  left: 85,
                  child: InkWell(
                    onTap: () => _showPicker(context),
                    child: Image.asset('assets/icons/camera-icon.png'),
                  ))
            ],
          ),
          ListTile(
            textColor: Colors.white,
            horizontalTitleGap: 20,
            contentPadding: EdgeInsets.all(10),
            title: Text(
              userName,
              // style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey)
            ),
            subtitle: Text(FirebaseAuth.instance.currentUser!.email.toString(),
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey)),
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: ColorConstants.color2,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/profile_pic.png'),
                radius: 26,
              ),
            ),
          ),
          // ListTile(
          //   textColor: Colors.white,
          //   horizontalTitleGap: 20,
          //   contentPadding: EdgeInsets.all(10),
          //   title: Text('name'),
          //   subtitle: Text('email'),
          //   leading: CircleAvatar(
          //     radius: 30,
          //     backgroundColor: ColorConstants.color2,
          //     child: CircleAvatar(
          //       backgroundImage: AssetImage('assets/profile_pic.png'),
          //       radius: 26,
          //     ),
          //   ),
          //
          // ),
          Container(
            child: Column(
              children: [
                OptionItem(
                  title: 'Orders',
                  leading: Icon(
                    Icons.shopping_bag_outlined,
                    color: ColorConstants.color3,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: ColorConstants.color3,
                    size: 15,
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) => OrdersScreen()));
                  },
                ),
                OptionItem(
                  title: 'My Details',
                  leading: Icon(
                    Icons.credit_card_rounded,
                    color: ColorConstants.color3,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: ColorConstants.color3,
                    size: 15,
                  ),
                ),
                OptionItem(
                  title: 'Delivery Address',
                  leading: Icon(
                    Icons.location_on_outlined,
                    color: ColorConstants.color3,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: ColorConstants.color3,
                    size: 15,
                  ),
                ),
                OptionItem(
                  title: 'Payment Method',
                  leading: Icon(
                    Icons.credit_card_rounded,
                    color: ColorConstants.color3,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: ColorConstants.color3,
                    size: 15,
                  ),
                ),
                OptionItem(
                  title: 'Settings',
                  leading: Icon(
                    Icons.settings,
                    color: ColorConstants.color3,
                  ),
                  onTap: () {
                    _settings(context);
                  },
                ),
                OptionItem(
                  title: 'Notifications',
                  leading: Icon(
                    Icons.notifications_none_rounded,
                    color: ColorConstants.color3,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: ColorConstants.color3,
                    size: 15,
                  ),
                ),
                OptionItem(
                  title: 'Help',
                  leading: Icon(
                    Icons.help_outline_outlined,
                    color: ColorConstants.color3,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: ColorConstants.color3,
                    size: 15,
                  ),
                ),
                OptionItem(
                  title: 'About',
                  leading: Icon(
                    Icons.perm_device_information,
                    color: ColorConstants.color3,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: ColorConstants.color3,
                    size: 15,
                  ),
                ),
              ],
            ),
          ),
          MyElevatedButton(
            onPressed: () async {
              CurrentUser _currentuser =
                  Provider.of<CurrentUser>(context, listen: false);

              await _currentuser.signOut();

              // pushAndRemoveUntil => clrar page stack history
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => OnBoardScreen()),
                  (route) => false);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.logout,
                  color: Colors.black,
                  size: 20,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Log Out',
                  style: TextStyle(color: ColorConstants.color1),
                )
              ],
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            width: 350,
          )
        ],
      ),
    );
  }
}

void _settings(context) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      backgroundColor: ColorConstants.color3,
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: 140,
          child: Wrap(
            children: <Widget>[
              ListTile(
                  leading: Icon(
                    Icons.brightness_4,
                    color: ColorConstants.color1,
                  ),
                  title: Text('Themes'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => SimpleDialog(
                        backgroundColor: ColorConstants.color1.withOpacity(0.8),
                        children: <Widget>[
                          ThemeButton(),
                        ],
                      ),
                    );
                  }),
              Divider(
                thickness: 1,
                indent: 50,
                endIndent: 50,
              ),
              ListTile(
                  leading: Icon(
                    CupertinoIcons.globe,
                    color: ColorConstants.color1,
                  ),
                  title: Text('App Language'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => SimpleDialog(
                        backgroundColor: ColorConstants.color1.withOpacity(0.8),
                        children: <Widget>[
                          LanguageButton(),
                        ],
                      ),
                    );
                  }),
            ],
          ),
        );
      });
}
