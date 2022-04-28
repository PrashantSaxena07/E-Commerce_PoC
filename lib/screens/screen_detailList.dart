import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../main.dart';
import '../widgets/item_ProductCard.dart';

class DetailList extends StatelessWidget {
  const DetailList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:
          Icon(Icons.arrow_back_ios_rounded, color: ColorConstants.color3),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text(
          "All Products",
          style: TextStyle(color: ColorConstants.color3),
        ),
        backgroundColor: ColorConstants.color1,
        elevation: 0,
      ),
      body:  FutureBuilder(
        future: ReadJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(child: Text("${data.error}"));
          } else if (data.hasData) {
            var items = data.data as List<ProductDataModel>;
            return ListView.builder(
                itemCount: items == null ? 0 : items.length,
                itemBuilder: (context, index) {
                  return
                    Card(
                      color: ColorConstants.color3,
                      elevation: 5,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              child: Image(
                                image:
                                NetworkImage(items[index].imageURL.toString()),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(bottom: 8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 8, right: 8),
                                        child: Text(
                                          items[index].name.toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8, right: 8),
                                        child: Text(items[index].price.toString()),
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
class ProductDataModel{
  //data Type
  int? id;
  String? name;
  String? category;
  String? imageURL;
  String? size;
  String? price;

// constructor
  ProductDataModel(
      {
        this.id,
        this.name,
        this.category,
        this.imageURL,
        this.size,
        this.price
      }
      );

  //method that assign values to respective datatype vairables
  ProductDataModel.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    name =json['name'];
    category = json['category'];
    imageURL = json['imageUrl'];
    size = json['size'];
    price = json['price'];
  }
}