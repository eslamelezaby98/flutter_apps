import 'package:flutter/material.dart';
import 'package:news_app/app_manager/app_size_manager.dart';
import 'package:news_app/app_manager/constants_manager.dart';
import 'package:news_app/app_manager/strings_manager.dart';
import 'package:news_app/views_model/article_list_view_model.dart';
import 'package:news_app/views_model/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late bool isActive;

  @override
  void initState() {
    super.initState();
    isActive = true;
    Provider.of<ArticlesListViewModel>(context, listen: false).fetchHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ArticlesListViewModel>(context);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Text(
            StringsManager.headlines,
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(height: AppSize.s16),
          Consumer<HomeViewModel>(
            builder: (context, value, child) => Container(
              height: 50,
              width: double.infinity,
              color: Colors.red,
              child: ListView.builder(
                itemCount: ContantsManager.countriesNames.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return value.getCountryName(
                      ContantsManager.countriesNames[index], context);
                },
              ),

              // child: ListView(
              //   scrollDirection: Axis.horizontal,
              //   children: [

              //     for (var i = 0; i < ContantsManager.countries.length; i++)
              //       Consumer<HomeViewModel>(
              //         builder: (context, value, child) {
              //           return value.getCountryName(
              //               ContantsManager.countriesNames[i], context);
              //         },

              //       )
              //   ],
              // ),
            ),
          ),
          const SizedBox(height: AppSize.s16),
          Expanded(
            child: GridView.builder(
              itemCount: provider.articlList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return GridTile(
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        provider.articlList[index].urlToImage,
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      )),
    );
  }

  // _getCountryName(bool isActive, String countryName) {
  //   if (isActive == true) {
  //     return Padding(
  //       padding: const EdgeInsets.all(AppSize.s12),
  //       child: InkWell(
  //         onTap: () {
  //           setState(() {
  //             isActive = false;
  //             print('tap $countryName');
  //           });
  //         },
  //         child: Text(
  //           countryName,
  //           style: Theme.of(context).textTheme.bodyText1,
  //         ),
  //       ),
  //     );
  //   } else {
  //     return InkWell(
  //       onTap: () {
  //         setState(() {
  //           isActive = true;
  //           print('tap $countryName');
  //         });
  //       },
  //       child: Padding(
  //         padding: const EdgeInsets.all(AppSize.s12),
  //         child: Text(
  //           countryName,
  //           style: Theme.of(context).textTheme.bodyText2,
  //         ),
  //       ),
  //     );
  //   }
  // }
}
