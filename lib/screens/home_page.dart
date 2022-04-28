import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:foot_wear_v6001/constants/constants.dart';
import 'package:foot_wear_v6001/screens/screen_account.dart';
import 'package:foot_wear_v6001/screens/screen_cart.dart';
import 'package:foot_wear_v6001/screens/screen_explore.dart';
import 'package:foot_wear_v6001/screens/screen_shop.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static  List<Widget> _pages = <Widget>[
   ShopScreen(),
    ExploreScreen(),
   CartScreen(),
   AccountScreen()

  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: InkWell(
          onTap: (){
            showDialog(context: context, builder: (context) =>
                SimpleDialog(

                  backgroundColor: ColorConstants.color1.withOpacity(0.8),
                  children: <Widget>[
                const CustomDialogBox(descriptions: 'fdg', text: 'have one notification', title: 'Notifications',),
                  ],
                ),);
          },
        // onTap: (){const CustomDialogBox(descriptions: 'fdg', text: 'have one notification', title: 'Notifications',);},
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: ColorConstants.color3,
              borderRadius: BorderRadius.circular(10)),
          child: Icon(Icons.notifications_none_rounded, color:  Color(0xFFE45826),),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      body: Center(
        child: _pages.elementAt(_selectedIndex), //New
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorConstants.color1,

        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 0,
        selectedItemColor: ColorConstants.color3,
        unselectedItemColor: ColorConstants.color2,
        items: <BottomNavigationBarItem>[

          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: 'Shop'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Explore'
          ),
          BottomNavigationBarItem(
            // icons: Icon(Icons.shopping_cart_outlined),
              icon: Consumer<Cart>(
                builder: (_, cart, ch2) => Badge(
                  badgeColor: ColorConstants.color3,
                    badgeContent: Text(cart.itemCount.toString()),
                    child: Icon(Icons.shopping_cart_outlined)),
              ),
              label: 'Cart'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account'
          ),
        ],
      ),


    );

  }
}





class CustomDialogBox extends StatefulWidget {
  final String title, descriptions, text;
  final Image? img;

  const CustomDialogBox({Key? key, required this.title, required this.descriptions, required this.text, this.img}) : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }
  contentBox(context){
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left:10,top: 45
              + 10, right:10,bottom: 10
          ),
          margin: EdgeInsets.only(top: 45),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
    color: Color(0xFFF0A500),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(color: Colors.black,offset: Offset(5,5),
                    blurRadius: 10
                ),
              ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(widget.title,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
              SizedBox(height: 15,),
              Text(widget.descriptions,style: TextStyle(fontSize: 14),textAlign: TextAlign.center,),
              SizedBox(height: 22,),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text(widget.text,style: TextStyle(fontSize: 18),)),
              ),
            ],
          ),
        ),
        Positioned(
          left:10,
          right: 10,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 45,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(45)),
                child: Image.asset("assets/shoes.png", scale: 8,)
            ),
          ),
        ),
      ],
    );
  }
}