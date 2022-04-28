import 'package:flutter/material.dart';

class OptionItem extends StatefulWidget {
  final String title;
  final subtitle;
  final leading;
  final trailing;
  final onTap;
  const OptionItem({Key? key,
    required this.title,
    this.subtitle,
    required this.leading,
    this.onTap,
    this.trailing,
  }) : super(key: key);

  @override
  State<OptionItem> createState() => _OptionItemState();
}

class _OptionItemState extends State<OptionItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      // onTap: () {
      //   Navigator.of(context).push(
      //     MaterialPageRoute(
      //       builder: (context) => const (),
      //     ),
      //   );
      // },
      child: Padding(
        padding: EdgeInsets.only(bottom: 8.0),
        child: ListTile(
          textColor: Colors.white,
          title: Text(widget.title,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500
            ),
          ),
          subtitle: widget.subtitle!=null?  Padding(
              padding: EdgeInsets.only(top: 6.0),
              child: Text(widget.subtitle! ,
                style: TextStyle(fontSize: 15),
              )
          ): null,
          leading: widget.leading,
          trailing: widget.trailing,
        ),
      ),
    );
  }
}
