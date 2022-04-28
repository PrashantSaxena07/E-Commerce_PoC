import 'package:flutter/material.dart';

import '../title_text.dart';

class ProfileWidget extends StatelessWidget {
 final Icon icon;
  final String title;
  final Function onTap;

  const ProfileWidget({Key? key, required this.icon, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(

      title: TitleText(text:title),
      leading: icon,
      trailing: Icon(Icons.arrow_forward_ios),
      onTap:()=> onTap(),

    );
  }
}
