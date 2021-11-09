import 'package:fltter_e_commerce_app/models/product_model.dart';
import 'package:fltter_e_commerce_app/services/remote_services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var productsList = <ProductsModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productsList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
