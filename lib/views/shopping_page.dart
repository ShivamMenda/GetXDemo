import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controllers/cart_controller.dart';
import 'package:getx_demo/controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({Key? key}) : super(key: key);
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        children: [
          Expanded(
            child: GetX<ShoppingController>(builder: (controller) {
              return ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: ((context, index) {
                  return Card(
                      margin: const EdgeInsets.all(12),
                      child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${controller.products[index].productName}',
                                          style: TextStyle(fontSize: 24),
                                        ),
                                        Text(
                                            '${controller.products[index].productDescription}'),
                                      ],
                                    ),
                                    Text(
                                        '\$${controller.products[index].price}',
                                        style: TextStyle(fontSize: 24)),
                                  ],
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    cartController
                                        .addToCart(controller.products[index]);
                                  },
                                  color: Colors.blue,
                                  textColor: Colors.white,
                                  child: Text('Add to Cart'),
                                ),
                              ])));
                }),
              );
            }),
          ),
          // GetBuilder<CartController>(
          //   builder: ((controller) {
          //     return Text(
          //       'Total Amount: \$ ${controller.testAmount}',
          //       style: TextStyle(fontSize: 32, color: Colors.white),
          //     );
          //   }),
          // ),
          // GetX<CartController>(builder: (controller) {
          //   return Text(
          //     "Total Amount: \$ ${controller.totalPrice} ",
          //     style: TextStyle(fontSize: 32, color: Colors.white),
          //   );
          // }),
          Obx((() {
            return Text(
              "Total Amount: \$ ${cartController.totalPrice} ",
              style: TextStyle(fontSize: 32, color: Colors.white),
            );
          })),
          SizedBox(
            height: 150,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.amber,
        icon: Icon(
          Icons.add_shopping_cart_rounded,
          color: Colors.black,
        ),
        label: GetX<CartController>(builder: (controller) {
          return Text(
            controller.cartCount.toString(),
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          );
        }),
      ),
    );
  }
}
