import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:getx_demo/services/remote_services.dart';

import '../models/products.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  var productList = <Product>[].obs;
  void fetchProducts() async {
    isLoading(true);
    try {
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
