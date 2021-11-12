import 'package:fltter_e_commerce_app/models/product_model.dart';
import 'package:fltter_e_commerce_app/services/remote_services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var productsList = <ProductsModel>[].obs;
  var isLoading = true.obs;
  var _productsCart = {}.obs;
  var price = 0;

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

  addProductToCart(ProductsModel productsModel) {
    if (_productsCart.containsKey(productsModel)) {
      _productsCart[productsModel] += 1;
    } else {
      _productsCart[productsModel] = 1;
    }
    update();
  }

  get productsCart => _productsCart;

  clacSubTotalPrice() {
    
  }
}
