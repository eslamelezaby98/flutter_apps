import 'package:e_commerce_fluter_app/data/dummy_data.dart/product_dummy_data.dart';
import 'package:e_commerce_fluter_app/helper/color_manager.dart';
import 'package:e_commerce_fluter_app/views/home_screen/category_widget.dart';
import 'package:e_commerce_fluter_app/views/home_screen/my_drawer.dart';
import 'package:e_commerce_fluter_app/views/home_screen/product_card_widget.dart';
import 'package:e_commerce_fluter_app/views/home_screen/search_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        drawer: const MyDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ColorManager.secondColor,
          items:const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: '',
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            //! user pic
            SliverAppBar(
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://preview.keenthemes.com/metronic-v4/theme_rtl/assets/pages/media/profile/profile_user.jpg',
                    ),
                  ),
                ),
              ],
            ),
            //! Search
            SliverAppBar(
              floating: true,
              pinned: true,
              leading: Container(),
              flexibleSpace: const SearchWidget(),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Our',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Text(
                          'Products',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ],
                    ),
                  ),
                  //! category
                  CategoriesWidget(size: size),
                ],
              ),
            ),
            //! product => category sneakers
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ProductCard(size: size, index: index);
                },
                childCount: ProductdummyData.products.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2 / 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
