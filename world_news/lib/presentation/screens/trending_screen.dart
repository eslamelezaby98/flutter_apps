import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:world_news/business_logic/cubit/article_cubit.dart';
import 'package:world_news/data/models/article.dart';
import 'package:world_news/helper/colors_manager.dart';
import 'package:world_news/helper/constants.dart';
import 'package:world_news/helper/value_manager.dart';

class TrendingScreen extends StatefulWidget {
  final int index;
  final String title;

  const TrendingScreen({
    Key? key,
    required this.index,
    required this.title,
  }) : super(key: key);

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  List<ArticleModel> articles = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleCubit, ArticleState>(
      builder: (context, state) {
        if (state is ArticelLoaded) {
          articles = (state).articles;
          return TrendingArticleWidget(
            articleModel: articles,
            title: widget.title,
            index: widget.index,
          );
        } else {
          return const CircleAvatar(
            maxRadius: AppSize.s50,
            backgroundImage: AssetImage(AssetsManager.loadImage2),
          );
        }
      },
    );
  }
}

class TrendingArticleWidget extends StatefulWidget {
  final List<ArticleModel> articleModel;
  final String title;
  final int index;

  const TrendingArticleWidget({
    Key? key,
    required this.articleModel,
    required this.title,
    required this.index,
  }) : super(key: key);

  @override
  State<TrendingArticleWidget> createState() => _TrendingArticleWidgetState();
}

class _TrendingArticleWidgetState extends State<TrendingArticleWidget> {
  @override
  void initState() {
    super.initState();
    // BlocProvider.of<ArticleCubit>(context).fetchHeadlines();
    BlocProvider.of<ArticleCubit>(context)
        .fetchArticleByCategory(ConstantsManager.categories[widget.index]);
  }

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
          title: Text(
            widget.title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        ArticleListWidget(articleModel: widget.articleModel),
      ],
    );
  }
}

class ArticleListWidget extends StatelessWidget {
  const ArticleListWidget({
    Key? key,
    required this.articleModel,
  }) : super(key: key);

  final List<ArticleModel> articleModel;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: const EdgeInsets.all(PaddingManager.p10),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark_border),
                  ),
                ),
                Container(
                  height: AppSize.s200,
                  width: AppSize.infintyWidth,
                  child: FadeInImage.assetNetwork(
                    placeholder: AssetsManager.loadImage2,
                    image: articleModel[index].urlToImage,
                    fit: BoxFit.cover,
                    height: AppSize.s200,
                    width: AppSize.infintyWidth,
                  ),
                  decoration: const BoxDecoration(
                    color: ColorsManager.primaryDark2,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(RaduisManager.w10),
                      topRight: Radius.circular(RaduisManager.w10),
                    ),
                  ),
                ),
                Container(
                  height: AppSize.s70,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: ColorsManager.primaryDark2,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(RaduisManager.w10),
                      bottomRight: Radius.circular(RaduisManager.w10),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      articleModel[index].title,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        childCount: articleModel.length,
      ),
    );
  }
}
