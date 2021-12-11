// import 'package:flutter/material.dart';
// import 'package:news_app/app_manager/route_manager.dart';
// import 'package:news_app/app_manager/strings_manager.dart';
// import 'package:news_app/views_model/article_list_view_model.dart';
// import 'package:news_app/views_model/article_view_model.dart';
// import 'package:provider/provider.dart';

// class AllNewsScreen extends StatefulWidget {
//   const AllNewsScreen({Key? key}) : super(key: key);

//   @override
//   _AllNewsScreenState createState() => _AllNewsScreenState();
// }

// class _AllNewsScreenState extends State<AllNewsScreen> {
//   final List<ArticlesListViewModel> articles = ;


//   @override
//   Widget build(BuildContext context) {
//     var provider = Provider.of<ArticlesListViewModel>(context);
//     return GridView.builder(
//       itemCount: articles.length,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount:
//               (MediaQuery.of(context).orientation == Orientation.portrait)
//                   ? 2
//                   : 3),
//       itemBuilder: (BuildContext _, int index) {
//         final article = articles[index];

//         return GestureDetector(
//           // onTap: () {
//           //   _showNewsArticleDetails(context, article);
//           // },
//           child: GridTile(
//             child: Container(
//               margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//               child: CircleImage(
//                 imageUrl: article.imageUrl,
//               ),
//             ),
//             footer: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               alignment: Alignment.center,
//               child: Text(
//                 article.title,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//           ),
//         );
//       },
//     );

//     //  SizedBox(
//     //   height: 500,
//     //   width: 200,
//     //   child:SingleChildScrollView(
//     //     child: Column(
//     //       children: [
//     //         // list of some news
//     //         Padding(
//     //           padding: const EdgeInsets.only(bottom: 10),
//     //           child: SizedBox(
//     //             height: 200,
//     //             width: 200,
//     //             child: ListView.builder(
//     //               itemCount: 5,
//     //               scrollDirection: Axis.horizontal,
//     //               itemBuilder: (context, index) {
//     //                 return InkWell(
//     //                   onTap: () {
//     //                     Navigator.pushNamed(context, Routes.articleDetialsScreen);
//     //                   },
//     //                   child: Padding(
//     //                     padding: const EdgeInsets.all(8.0),
//     //                     child: Container(
//     //                       height: 200,
//     //                       width: 300,
//     //                       child: Align(
//     //                         alignment: Alignment.bottomCenter,
//     //                         child: Text(
//     //                           provider.articlList[index].title,
//     //                           style: Theme.of(context).textTheme.headline1,
//     //                           textAlign: TextAlign.start,
//     //                         ),
//     //                       ),
//     //                       decoration: BoxDecoration(
//     //                         color: Colors.black,
//     //                         borderRadius: BorderRadius.circular(10),
//     //                         image: DecorationImage(
//     //                           fit: BoxFit.cover,
//     //                           image: NetworkImage(
//     //                             provider.articlList[index].urlToImage,
//     //                           ),
//     //                         ),
//     //                       ),
//     //                     ),
//     //                   ),
//     //                 );
//     //               },
//     //             ),
//     //           ),
//     //         ),
//     //         Padding(
//     //           padding: const EdgeInsets.only(bottom: 10),
//     //           child: Text(
//     //             StringsManager.lastNews,
//     //             style: Theme.of(context).textTheme.bodyText1,
//     //           ),
//     //         ),
//     //         SizedBox(
//     //           height: 200,
//     //           child: ListView.builder(
//     //             itemCount: provider.articlList.length,
//     //             itemBuilder: (context, index) {
//     //               return Padding(
//     //                 padding: const EdgeInsets.only(bottom: 10),
//     //                 child: ListTile(
//     //                   onTap: () {
//     //                     // move to detials screen
//     //                   },
//     //                   title: Text(
//     //                     provider.articlList[index].title,
//     //                     style: Theme.of(context).textTheme.bodyText2,
//     //                   ),
//     //                   leading: Container(
//     //                     height: 200,
//     //                     width: 100,
//     //                     decoration: BoxDecoration(
//     //                       image: DecorationImage(
//     //                         fit: BoxFit.cover,
//     //                         image: NetworkImage(
//     //                           provider.articlList[index].urlToImage,
//     //                         ),
//     //                       ),
//     //                     ),
//     //                   ),
//     //                   subtitle: Text(
//     //                     provider.articlList[index].author,
//     //                     style: Theme.of(context).textTheme.caption,
//     //                   ),
//     //                 ),
//     //               );
//     //             },
//     //           ),
//     //         )
//     //       ],
//     //     ),
//     //   ),
//     // );
//   }
// }
