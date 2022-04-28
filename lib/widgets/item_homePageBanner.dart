import 'package:flutter/material.dart';
import 'package:foot_wear_v6001/widgets/item_ProductCard.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';
import '../screens/screen_detailList.dart';
class HomePageBanner extends StatefulWidget {
  final String title;
  const HomePageBanner({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePageBanner> createState() => _HomePageBannerState();
}

class _HomePageBannerState extends State<HomePageBanner> {
  @override
  Widget build(BuildContext context) {
    final productsdata = Provider.of<Products>(context);
    final products = productsdata.items;
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Color(0xFFE6D5B8),

              ),),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailList()));
                },
                child: Text('See all',
                  style: TextStyle(
                    fontSize: 16,
                    color:  Color(0xFFE45826),

                  ),),
              ),
            ],
          ),
      Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 250.0,
        child: ListView.builder(
          // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          //     maxCrossAxisExtent: 200,
          //     childAspectRatio: 1.5,
          //     crossAxisSpacing: 5,
          //     mainAxisSpacing: 5),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          // scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return ChangeNotifierProvider.value(
              value: products[index],
              child: const ProductCard(
                // name: products[index].name,
                // price: products[index].price,
                // image: products[index].image,
                // id: products[index].id,
              ),
            );
          },
        ),
      )


        ],
      ),
    );
  }
}