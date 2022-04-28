import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/constants.dart';
import '../constants/theme/theme_provider.dart';
import '../providers/products_provider.dart';
import '../widgets/item_ProductCard.dart';

class FavouritesScreen extends StatefulWidget {
  const     FavouritesScreen({Key? key}) : super(key: key);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    final productsdata = Provider.of<Products>(context);
    final products = productsdata.favItems;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:
          Icon(Icons.arrow_back_ios_rounded, color: ColorConstants.color3),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0,
        centerTitle: true,
        title: Text("Your WishList"),
        backgroundColor: ColorConstants.color1,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.9,
        child:  ListView.builder(
          // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          //     maxCrossAxisExtent: 200,
          //     childAspectRatio: 1.5,
          //     crossAxisSpacing: 5,
          //     mainAxisSpacing: 5),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
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
      ),
    );
  }
}

