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
          return const CircleAvatar(
            backgroundImage: AssetImage('assets/images/loading.gif'),
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
        ArticleListWidget(articleModel: articleModel),
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
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 170,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorsManager.primaryDark2,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 160,
                      width: 150,
                      child: articleModel[index].urlToImage.isNotEmpty
                          ? FadeInImage.assetNetwork(
                              fit: BoxFit.cover,
                              placeholder: 'assets/images/loading.gif',
                              image: articleModel[index].urlToImage)
                          : Image.asset('assets/images/loading.gif'),
                      decoration: BoxDecoration(
                        color: ColorsManager.primaryDark2,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 200,
                          height: 100,
                          child: Text(
                            articleModel[index].title,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              articleModel[index].author,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                  Icons.bookmark_border_outlined),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        childCount: articleModel.length,
      ),
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
              FadeInImage.assetNetwork(
                fit: BoxFit.cover,
                placeholder: 'assets/images/loading.gif',
                image: articleModel.urlToImage,
                height: 250,
                width: 300,
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
