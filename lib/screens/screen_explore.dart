import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../constants/data/data_footwear.dart';
import '../../model/footwear.dart';
import '../../widgets/search_widget.dart';

class ExploreScreen extends StatefulWidget {
  @override
  ExploreScreenState createState() => ExploreScreenState();
}

class ExploreScreenState extends State<ExploreScreen> {
  late List<Footwear> footwear;
  String query = '';


  @override
  void initState() {
    super.initState();

    footwear = allFootwear;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      elevation: 0,
      backgroundColor: ColorConstants.color1,
      centerTitle: true,
      title: Text('Find Products', style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold),),
    ),

    body: Column(
      children: <Widget>[
        buildSearch(),
        Expanded(
          child: ListView.builder(
            itemCount: footwear.length,
            itemBuilder: (context, index) {
              final book = footwear[index];

              return buildFootwear(book);
            },
          ),
        ),
      ],
    ),
  );

  Widget buildSearch() => Container(
    child: SearchWidget(
      text: query,
      hintText: 'Product or Category',
      onChanged: searchFootwear,
    ),
  );

  Widget buildFootwear(Footwear footwear) => ListTile(
    textColor: ColorConstants.color4,

    leading: Image.network(
      footwear.urlImage,
      fit: BoxFit.cover,
      width: 50,
      height: 50,
    ),
    title: Text(footwear.title),
    subtitle: Text(footwear.category),
  );

  void searchFootwear(String query) {
    final footwear = allFootwear.where((footwear) {
      final titleLower = footwear.title.toLowerCase();
      final categoryLower = footwear.category.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          categoryLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.footwear = footwear;
    });
  }
}


/* Widget buildBottomBar() {
    final style = TextStyle(color: Colors.white);

    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      currentIndex: index,
      items: [
        BottomNavigationBarItem(
          icon: Text('Filter List', style: style),
          label:'Local',
        ),
        BottomNavigationBarItem(
          icon: Text('Filter List', style: style),
          label:'Network',
        ),
      ],
      onTap: (int index) => setState(() => this.index = index),
    );
  }

  Widget buildPages() {
    switch (index) {
      case 0:
        return FilterLocalListPage();
      case 1:
        return FilterNetworkListPage();
      default:
        return Container();
    }
  }
}

*/

/*appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConstants.color1,
        centerTitle: true,
        title: Text('Find Products', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:25, right: 25),
        child: CategoryItem(bordercolor: ColorConstants.color3, category: 'boots', itemImage: Image.asset('assets/footwear/footwear1.png'),),
      ),*/