import 'package:flutter/material.dart';
import '../../data/models/article.dart';
import '../../helper/colors_manager.dart';
import '../../helper/value_manager.dart';

class ArticleDetialsScreen extends StatelessWidget {
  final ArticleModel articleModel;
  const ArticleDetialsScreen({Key? key, required this.articleModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            pinned: false,
            centerTitle: false,
            backgroundColor: ColorsManager.primaryDark,
            toolbarHeight: 400,
            leading: const BackButton(
              color: ColorsManager.seletedColor,
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                articleModel.author,
                style: Theme.of(context).textTheme.headline2,
              ),
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
      ),
    );
  }
}
