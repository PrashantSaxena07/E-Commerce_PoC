import 'package:flutter/material.dart';
import 'package:foot_wear_v6001/constants/constants.dart';

class CategoryItem extends StatelessWidget {
  final String category;
  final Color bordercolor;
  final Image itemImage;
  const CategoryItem({
    Key? key,
    required this.category,
    required this.bordercolor,
    required this.itemImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 174.5,
      height: 189.11,
      decoration: BoxDecoration(
          border: Border.all(
            color: bordercolor,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/footwear/footwear1.png', scale: 5.5,),
            Text(category, style: TextStyle(
              color: ColorConstants.color3,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),)
          ],
        ),
      ),
    );
  }
}
