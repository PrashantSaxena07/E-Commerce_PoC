import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:foot_wear_v6001/constants/constants.dart';
import 'package:foot_wear_v6001/screens/screen_account.dart';
import 'package:foot_wear_v6001/screens/screen_cart.dart';

import '../widgets/item_homePageBanner.dart';
import '../widgets/style_GradientText.dart';

class ShopScreen extends StatefulWidget {

  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final List<String> imagesList = [
    "https://fashionsista.co/wallpaper/wallpaper/20210409/vans-wallpaper-iphone-hd-61-images-thumb.jpg",
    "https://wallpaper.dog/large/253783.jpg",
    "https://i.guim.co.uk/img/media/3703d107f9de918c64e960d624986a0c54ba96b6/30_0_915_549/master/915.jpg?width=1200&quality=85&auto=format&fit=max&s=85b26de6a319afb8d34609f3b012b145"
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 20),
            height: 160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Container(
                height: 80,
                decoration: BoxDecoration(
                    color: ColorConstants.color4.withOpacity(0.2),
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15))
                ),
                width: MediaQuery.of(context).size.width * 100,

                child: Padding(
                  padding: const EdgeInsets.only(top:22, left: 15,),
                  child: Row(
                    children: [
                      Image.asset('assets/shoes_small.png',scale: 1.7,),
                      SizedBox(width: 20,),
                      // GradientText('Foot Wear',style: TextStyle(
                      //
                      //     fontWeight: FontWeight.bold,
                      //     fontSize: 35,
                      //     letterSpacing: 5,
                      //     color: ColorConstants.color1
                      // ),
                      //   gradient: LinearGradient(colors: [
                      //     ColorConstants.color2,
                      //     ColorConstants.color3,
                      //   ]),),

                  Text('Foot Wear',style: TextStyle(

                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        letterSpacing: 2.5,
                        color: ColorConstants.color1
                    ),)
                    ],
                  )
                ),
              ),
                Padding(
                  padding: const EdgeInsets.only(right: 5, left: 5),
                  child: _search(),
                ),],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(5),
              color: ColorConstants.color3,
              child: CarouselSlider(
                // onPageChanged: (index) {
                //   _currentIndex = index;
                //   setState((){});
                // },
                options: CarouselOptions(
                  autoPlay: true,
                ),
                items: imagesList
                    .map(
                      (item) => Center(
                    child: GestureDetector(
                      child: Image.network(
                        item,
                        fit: BoxFit.fill,
                        width: MediaQuery.of(context).size.width,
                        height:
                        MediaQuery.of(context).size.height,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CartScreen()),
                        );
                      },
                    ),
                  ),
                )
                    .toList(),
              ),
            ),
          ),
          HomePageBanner(title: 'Exclusive Offer',),
          HomePageBanner(title: 'Hot Deals',),
          HomePageBanner(title: 'Budget Deal',),

        ],
      ),
    );
  }
}

Widget _search() {
  return Container(
    // margin: AppTheme.padding,
    child: Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 40,
            alignment: Alignment.center,
            // decoration: BoxDecoration(
            //     // color: ColorConstants.color3.withAlpha(100),
            //     borderRadius: BorderRadius.all(Radius.circular(20))),
            child: TextField(
              cursorColor: ColorConstants.color2,
              decoration: InputDecoration(
                filled: true,
                fillColor: ColorConstants.color3,
                  enabledBorder: UnderlineInputBorder(
                    // borderSide: new BorderSide(color: Colors.white),
                    borderRadius: new BorderRadius.circular(30),
                  ),
                  border: InputBorder.none,
                  hintText: "Search Shop",
                  hintStyle: TextStyle(fontSize: 12),
                  contentPadding:
                  EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 5),
                  prefixIcon: Icon(Icons.search, color: Colors.black54)),
            ),
          ),
        ),
        // SizedBox(width: 20),
        // Icon(Icons.filter_list, color: ColorConstants.color3)
      ],
    ),
  );
}
