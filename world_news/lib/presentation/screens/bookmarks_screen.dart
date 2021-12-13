import 'package:flutter/material.dart';
import 'package:world_news/helper/colors_manager.dart';
import 'package:world_news/helper/value_manager.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as List; 
    return arg.isEmpty
        ? Container()
        : CustomScrollView(
            slivers: [
              const SliverAppBar(
                floating: true,
                snap: true,
                pinned: false,
                centerTitle: false,
                backgroundColor: ColorsManager.primaryDark,
                title: Text('Bookmarks'),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(PaddingManager.p8),
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                          color: ColorsManager.primaryDark2,
                          borderRadius:
                              BorderRadius.circular(RaduisManager.w10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              arg[index].urlToImage,
                            ),
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.delete)),
                          ),
                          Text(
                            arg[index].title,
                            // 'Exclusive: Facebook owner is behind \$60 mln deal for Meta name rights - Reuters',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                  backgroundColor: ColorsManager.primaryDark,
                                ),
                          ),
                        ],
                      ),
                    ),
                  );
                }, childCount: arg.length),
              ),
            ],
          );
  }
}
