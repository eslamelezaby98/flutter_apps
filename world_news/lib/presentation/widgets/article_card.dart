import 'package:flutter/material.dart';
import '../../data/models/article.dart';
import '../../helper/colors_manager.dart';
import '../../helper/router_manager.dart';
import '../../helper/value_manager.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    Key? key,
    required this.articleModel,
  }) : super(key: key);

  final List<ArticleModel> articleModel;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.articleDetialsScreen, arguments: articleModel[index]);
            },
            child: Padding(
              padding: const EdgeInsets.all(PaddingManager.p10),
              child: Column(
                children: [
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
                    decoration:  BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      border: Border.all(color: Theme.of(context).primaryColorLight),
                      borderRadius:const BorderRadius.only(
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
            ),
          );
        },
        childCount: articleModel.length,
      ),
    );
  }
}
