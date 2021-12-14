import 'package:flutter/material.dart';
import 'package:world_news/data/models/article.dart';
import 'package:world_news/helper/colors_manager.dart';
import 'package:world_news/helper/value_manager.dart';

class ArticleDetialsScreen extends StatelessWidget {
  final ArticleModel articleModel;
  const ArticleDetialsScreen({Key? key, required this.articleModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          snap: true,
          pinned: false,
          centerTitle: false,
          backgroundColor: ColorsManager.primaryDark,
          toolbarHeight: 500,
          leading: const BackButton(
            color: ColorsManager.seletedColor,
          ),
          flexibleSpace: FlexibleSpaceBar(
            title: Text(articleModel.author),
            background: Image(
              fit: BoxFit.cover,
              image: NetworkImage(
                articleModel.urlToImage,
              ),
            ),
          ),
          
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Text(
                articleModel.title,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const Divider(
                color: ColorsManager.seletedColor,
                thickness: AppSize.s5,
              ),
              Text(
                articleModel.description,
                style: Theme.of(context).textTheme.headline2,
              ),
              const Divider(
                color: ColorsManager.seletedColor,
                thickness: AppSize.s5,
              ),
              Text(
                articleModel.content,
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
