import 'package:dio/dio.dart';
import 'package:world_news/helper/constants.dart';

class ArticelWebServices {
  late Dio dio;

  ArticelWebServices() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: ConstantsManager.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 10 * 1000,
      receiveTimeout: 10 * 1000,
    );
    dio = Dio(baseOptions);
  }

  Future<List<dynamic>> fetchTrendingArticles() async {
    try {
      Response response = await dio.get(ConstantsManager.baseUrl);
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
