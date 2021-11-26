import 'package:fltter_e_commerce_app/models/product_model.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();

  static Future<List<ProductsModel>?> fetchProducts() async {
    var response =
        await client.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productsModelFromJson(jsonData);
    } else {
      print('Error when fetching json data');
      return null;
    }
  }
}
