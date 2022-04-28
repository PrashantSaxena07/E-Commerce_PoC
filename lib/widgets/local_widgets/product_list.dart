// import 'package:flutter/material.dart';
//
// import '../../../widgets/product_card.dart';
//
// class HomePageBanner extends StatefulWidget {
//   final String title;
//   const HomePageBanner({Key? key, required this.title}) : super(key: key);
//
//   @override
//   State<HomePageBanner> createState() => _HomePageBannerState();
// }
//
// class _HomePageBannerState extends State<HomePageBanner> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(left: 10, right: 10),
//       child: Column(
//         children: [
//           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(widget.title,
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.w600,
//                   color: Color(0xFFE6D5B8),
//
//                 ),),
//               Text('See all',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color:  Color(0xFFE45826),
//
//                 ),),
//             ],
//           ),
//           Container(
//               margin: EdgeInsets.symmetric(vertical: 20.0),
//               height: 250.0,
//               child: FutureBuilder(
//                 builder: (context, data) {
//                   if (data.hasError) {
//                     return Center(child: Text("${data.error}"));
//                   } else if (data.hasData) {
//                     var items = data.data as List<ProductDataModel>;
//                     return ListView.builder(
//                         itemCount: items == null ? 0 : items.length,
//                         scrollDirection: Axis.horizontal,
//                         itemBuilder: (context, index) {
//                           return
//                             ProductCard(model:items[index]);
//                         });
//                   } else {
//                     return Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//                 },
//               ))
//
//
//         ],
//       ),
//     );
//   }
// }
