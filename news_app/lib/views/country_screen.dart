import 'package:flutter/material.dart';
import 'package:news_app/app_manager/color_manager.dart';
import 'package:news_app/models/country_model.dart';
import 'package:news_app/views_model/country_model_view.dart';
import 'package:provider/provider.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({Key? key}) : super(key: key);

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CountryModel>(context);
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          floating: true,
          snap: false,
          expandedHeight: 200,
          backgroundColor: ColorManager.blue,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'Trending',
              style: Theme.of(context).textTheme.headline1,
            ),
            background: Image.network(
              "https://www.state.gov/wp-content/uploads/2019/04/Egypt-2109x1406.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 250,
                width: double.infinity,
                child: Center(
                  child: Text(
                    provider.countriesList[index]['name'],
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      provider.countriesList[index]['urlImage'],
                    ),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          }, childCount: 4),
        )
      ],
    );
  }
}
