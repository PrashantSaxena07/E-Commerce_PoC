import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foot_wear_v6001/screens/screen_ProductDetail.dart';
import 'package:provider/provider.dart';

import '../model/product.dart';
import '../providers/cart_provider.dart';
import 'item_elevatedbutton.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context, listen: false);
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(10),
        // color: Color(0xFFE6D5B8),
        decoration: BoxDecoration(
            color: Color(0xFFE6D5B8).withOpacity(0.1),
            borderRadius: BorderRadius.circular(10)),
        // color: Colors.grey.withOpacity(0.8),
        height: 248.51,
        width: 173.32,
        child: Stack(
          children: [Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                child: Image.network(
                  product.image,
                  scale: 4.5,
                ),

                //newscreen
                 onTap: () {
                    Navigator.of(context).pushNamed(ProductsDetailScreen.routeName,
                        arguments: {
                          "id": product.id,
                          "name": product.name,
                          "price": product.price
                        });
                    //       // Navigator.of(context)
                    //       //     .pushNamed(ProductsDetailScreen.routeName, arguments: product.id);
                  },

                //bottomsheet
                // onTap: () => _showDetailSheet(context, product),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      )),
                  /*Text(product.size,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,)),*/
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(product.price.toString(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF0A500),
                          )),
                      Container(
                        height: 45.67,
                        width: 45.67,
                        decoration: BoxDecoration(
                            color: Color(0xffE45826).withOpacity(0.8),
                            borderRadius: BorderRadius.circular(5)),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
            Align(
           alignment: Alignment.topRight,
              child: Consumer<Product>(
                builder: (ctx, product, child) => IconButton(
                  icon: Icon(
                    product.isFav ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    product.toggleFavouriteStatus();
                  },
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}

void _showDetailSheet(BuildContext context, Product product) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      backgroundColor: Color(0xFFE6D5B8).withOpacity(0.7),
      context: context,
      builder: (BuildContext bc){
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.9,
            child: Wrap(
              children: <Widget>[
                Center(
                    child: Image.asset(
                  product.image,
                  scale: 3,
                )),
                ListTile(
                  title: Text(
                    product.name,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        wordSpacing: 4,
                        color: Colors.black),
                  ),
                  subtitle: Text(
                    '\$799',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        wordSpacing: 4,
                        color: Colors.grey),
                  ),
                  trailing: Icon(Icons.favorite_border),
                ),
                Container(
                  width: 500,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              CupertinoIcons.minus,
                              color: Colors.red,
                            ),
                            Text(
                              '1',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  wordSpacing: 4,
                                  color: Colors.black87),
                            ),
                            Icon(
                              Icons.add,
                              color: Colors.green,
                            )
                          ],
                        ),
                      ),
                      Text('4.99',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                    ],
                  ),
                ),
                ListTile(
                  title: Text(
                    'Material',
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
                ListTile(
                  title: Text(
                    'Review',
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
                MyElevatedButton(
                  width: 350,
                  onPressed: () {},
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(color: Colors.black),
                  ),
                  borderRadius: BorderRadius.circular(20),
                )
              ],
            ),
          ),
        );
      });
}
