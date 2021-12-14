import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:world_news/business_logic/cubit/article_cubit.dart';
import 'package:world_news/data/models/article.dart';
import 'package:world_news/helper/colors_manager.dart';
import 'package:world_news/helper/constants.dart';
import 'package:world_news/helper/value_manager.dart';
import 'package:world_news/presentation/widgets/article_card.dart';

class CategoryScreen extends StatefulWidget {
  final int index;
  final String title;

  const CategoryScreen({
    Key? key,
    required this.index,
    required this.title,
  }) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<ArticleModel> articles = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleCubit, ArticleState>(
      builder: (context, state) {
        if (state is ArticelLoaded) {
          articles = (state).articles;
          return ArticlesCardList(
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

class ArticlesCardList extends StatefulWidget {
  final List<ArticleModel> articleModel;
  final String title;
  final int index;

  const ArticlesCardList({
    Key? key,
    required this.articleModel,
    required this.title,
    required this.index,
  }) : super(key: key);

  @override
  State<ArticlesCardList> createState() => _ArticlesCardListState();
}

class _ArticlesCardListState extends State<ArticlesCardList> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ArticleCubit>(context)
        .fetchArticleByCategory(ConstantsManager.categories[widget.index]);
  }

  bool isSearch = false;
  final searchTextController = TextEditingController();
  late List<ArticleModel> articleSearchList = [];

  searchField() {
    return TextField(
      controller: searchTextController,
      cursorColor: Colors.white,
      decoration: const InputDecoration(
        hintText: 'Find a character...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: ColorsManager.white, fontSize: 18),
      ),
      style: const TextStyle(color: ColorsManager.white, fontSize: 18),
      onChanged: (searchedCharacter) {
        addSearchedFOrItemsToSearchedList(searchedCharacter);
      },
    );
  }

  addSearchedFOrItemsToSearchedList(String searchedCharacter) {
    articleSearchList = widget.articleModel
        .where((element) =>
            element.title.toLowerCase().startsWith(searchedCharacter))
        .toList();

    setState(() {});
  }

  appBarItems() {
    if (isSearch) {
      return [
        IconButton(
          onPressed: () {
            clearSearch();
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.clear,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: startSearch,
          icon: Icon(
            Icons.search,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
      ];
    }
  }

  clearSearch() {
    setState(() {
      searchTextController.clear();
    });
  }

  startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearch));
    setState(() {
      isSearch = true;
    });
  }

  stopSearch() {
    clearSearch();
    setState(() {
      isSearch = false;
    });
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
          backgroundColor: Theme.of(context).primaryColor,
          leading: isSearch
              ? BackButton(
                  color: Theme.of(context).primaryColorDark,
                )
              : Container(),
          actions: appBarItems(),
          title: isSearch
              ? searchField()
              : Text(
                  widget.title,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
        ),
        ArticleCard(
          articleModel: isSearch ? articleSearchList : widget.articleModel,
        ),
      ],
    );
  }
}
