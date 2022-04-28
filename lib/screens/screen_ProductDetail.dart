import 'package:flutter/material.dart';
import 'package:foot_wear_v6001/screens/screen_cart.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../model/product.dart';
import '../providers/cart_provider.dart';
import '../providers/products_provider.dart';


class ProductsDetailScreen extends StatefulWidget {
  static const routeName = '/product-detail';

  @override
  State<ProductsDetailScreen> createState() => _ProductsDetailScreenState();
}

class _ProductsDetailScreenState extends State<ProductsDetailScreen> {

  late Product product;
  late Cart cart;

  @override
  void initState() {
    // product = Provider.of<Product>(context);
    cart = Provider.of<Cart>(context, listen: false);
    super.initState();
  }
// final String title;
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    final arg = ModalRoute.of(context)?.settings.arguments as Map;

    // final productId = ModalRoute.of(context)?.settings.arguments as int;
    // final loadedProduct =
    //     Provider.of<Products>(context, listen: false).findById(productId);



    final productId = arg['id'];
    final productName = arg['name'].toString();
    var productprice;

    try{
      productprice=double.parse(arg['price'].toString());
    }
    catch(e){
      productprice=0.0;

    }

    final loadedProduct =
    Provider.of<Products>(context, listen: false).findById(productId);

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: ColorConstants.color3,
        // child: Icon(Icons.shopping_cart),
        onPressed: () {
          print("name$productName");
          print("price$productprice");



          cart.addItem(productId.toString(), productprice, productName);

        }, label: Text("Add to Cart", style: TextStyle(color: ColorConstants.color1),),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(loadedProduct.name, style: TextStyle(color: ColorConstants.color3),),
        backgroundColor: ColorConstants.color1,
        elevation: 0,
        actions: [
          // IconButton(
          //   icon: Icon(
          //     product.isFav ? Icons.favorite : Icons.favorite_border,
          //     color: Colors.red[200],
          //   ),
          //   onPressed: () {
          //     product.toggleFavouriteStatus();
          //   },
          // ),
          IconButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartScreen()),
            );
          }, icon: Icon(
            Icons.shopping_cart_outlined,
            color: ColorConstants.color3,
          ))
        ],
        leading: IconButton(
          icon:
          Icon(Icons.arrow_back_ios_rounded, color: ColorConstants.color3),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(loadedProduct.image))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    loadedProduct.name,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: ColorConstants.color3),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Rs " + loadedProduct.price.toString(), style: TextStyle(color: Colors.white),)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(loadedProduct.decscription,
                      style: TextStyle(
                        color: Colors.white,
                          letterSpacing: 5,fontSize: 16.0))),
            ),
          ],
        ),
      ),
    );
  }
}
