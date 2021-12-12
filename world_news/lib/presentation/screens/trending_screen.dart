import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_news/business_logic/cubit/article_cubit.dart';
import 'package:world_news/data/models/article.dart';
import 'package:world_news/helper/colors_manager.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({Key? key}) : super(key: key);

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  List<ArticleModel> articles = [];

  @override
  void initState() {
    articles = BlocProvider.of<ArticleCubit>(context).fetchHeadlines();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleCubit, ArticleState>(
      builder: (context, state) {
        if (state is ArticelLoaded) {
          articles = (state).articles;
          return TrendingArticleWidget(
            articleModel: articles,
          );
        } else {
          return const SizedBox(
            height: 50,
            width: 50,
            child: CircularProgressIndicator(
              color: ColorsManager.seletedColor,
              // strokeWidth: 50,
              backgroundColor: Colors.white24,
            ),
          );
        }
      },
    );
  }
}

class TrendingArticleWidget extends StatelessWidget {
  final List<ArticleModel> articleModel;

  const TrendingArticleWidget({Key? key, required this.articleModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          centerTitle: false,
          backgroundColor: ColorsManager.primaryDark,
          title: Text(
            'Suggest for you',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 250,
            width: double.infinity,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SuggectArticleCard(
                  articleModel: articleModel[index],
                );
              },
            ),
          ),
        ),
        SliverAppBar(
          floating: true,
          snap: true,
          pinned: false,
          centerTitle: false,
          backgroundColor: ColorsManager.primaryDark,
          title: Text(
            'Least News',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return SuggectArticleCard(articleModel: articleModel[index]);
            },
            childCount: articleModel.length,
          ),
        ),
      ],
    );
  }
}

class SuggectArticleCard extends StatelessWidget {
  const SuggectArticleCard({
    Key? key,
    required this.articleModel,
  }) : super(key: key);

  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // move to detials
      },
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: SizedBox(
          height: 250,
          width: 300,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(articleModel.urlToImage),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    articleModel.publishedAt,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark_border_outlined),
                  ),
                ],
              ),
              Positioned(
                bottom: 15,
                left: 10,
                right: 10,
                child: Text(
                  articleModel.title,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
