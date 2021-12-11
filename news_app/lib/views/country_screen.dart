import 'package:flutter/material.dart';
import 'package:news_app/app_manager/color_manager.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({Key? key}) : super(key: key);

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          toolbarHeight: 200,
          backgroundColor: ColorManager.blue,
          flexibleSpace: const FlexibleSpaceBar(
            title: Text("Countries"),
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300.0,
            mainAxisSpacing: 100,
            crossAxisSpacing: 10,
          mainAxisExtent: 2,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://thirdeyetraveller.com/wp-content/uploads/IMG_3619-2-689x861.jpg',
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Egypt',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
              ),
            ),
            childCount: 4,
          ),
        ),
      ],
    );
  }
}
