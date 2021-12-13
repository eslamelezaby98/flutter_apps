import 'package:world_news/helper/constants.dart';

class ArticleCategoryModel {
  late String name;
  late String description;
  late String url;

  ArticleCategoryModel({
    required this.name,
    required this.description,
    required this.url,
  });

  factory ArticleCategoryModel.fromJson(Map<String, dynamic> json) {
    return ArticleCategoryModel(
      name: json[ConstantsManager.name] ?? '',
      url: json[ConstantsManager.categoryUrl] ?? '',
      description: json[ConstantsManager.categoryDescription] ?? '',
    );
  }
}
