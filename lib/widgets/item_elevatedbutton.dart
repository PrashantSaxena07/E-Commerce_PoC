import 'package:flutter/material.dart';
import 'package:foot_wear_v6001/constants/constants.dart';


class MyElevatedButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final VoidCallback? onPressed;
  final Widget child;

  const MyElevatedButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.height = 44.0,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(0);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: ColorConstants.color3,
          borderRadius: borderRadius,
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
          ),
          child: child,
        ),
      ),
    );
  }
}

