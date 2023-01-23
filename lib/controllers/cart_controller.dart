import 'package:get/get.dart';
import 'package:getx_demo/models/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  int get cartCount => cartItems.length;
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);

  // var testAmount = 0.0;

  addToCart(Product product) {
    cartItems.add(product);
    // testAmount = totalPrice;
    // update();
  }
}
