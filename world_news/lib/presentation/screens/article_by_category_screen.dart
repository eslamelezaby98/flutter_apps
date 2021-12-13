// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:world_news/business_logic/cubit/article_cubit.dart';
// import 'package:world_news/data/models/article.dart';
// import 'package:world_news/helper/string_manager.dart';
// import 'package:world_news/helper/value_manager.dart';
// import 'package:world_news/presentation/screens/trending_screen.dart';

// class ArticleCategoryByScreen extends StatefulWidget {
//   const ArticleCategoryByScreen({Key? key}) : super(key: key);

//   @override
//   _ArticleCategoryByScreenState createState() =>
//       _ArticleCategoryByScreenState();
// }

// class _ArticleCategoryByScreenState extends State<ArticleCategoryByScreen> {
//   List<ArticleModel> artticlesByCategory = [];

//   @override
//   void initState() {
//     super.initState();
//     artticlesByCategory = BlocProvider.of<ArticleCubit>(context)
//         .fetchTrendingArticlesByCategory();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ArticleCubit, ArticleState>(
//       builder: (context, state) {
//         if (state is ArticelLoaded) {
//           artticlesByCategory = (state).articles;
//           return TrendingArticleWidget(
//             articleModel: artticlesByCategory,
//             title: StringManager.business,
//           );
//         } else {
//           return const CircleAvatar(
//             maxRadius: AppSize.s50,
//             backgroundImage: AssetImage(AssetsManager.loadImage2),
//           );
//         }
//       },
//     );
//   }
// }
