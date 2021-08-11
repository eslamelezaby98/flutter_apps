import 'package:http/http.dart' as http;
import 'package:news_app_strapi/models/categories_model.dart';

class ApiNetwork {
  String url = 'http://10.0.2.2:1337/categories';
  Future<List<CategoriesModel>> getCategory() async {
    // Error in API
    http.Response response = await http.get(Uri.parse(url));
    var jsonBody = response.body;
    List<CategoriesModel> category = categoriesApiFromJson(jsonBody);
    // print(jsonBody);
    return category;
  }
}

// class ApiNetworkArticle{
//   String url = 'http://10.0.2.2:1337/'
// }
