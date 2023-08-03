import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  var res = "".obs;

  Future loginAPI() async {
    try {
      final response = await post(
        Uri.parse("https://reqres.in/api/login"),
        body: {
          "email": emailController.value.text,
          "password": passwordController.value.text,
        },
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Get.snackbar("Success", "Successful");
        res.value = data["token"];
      } else {
        Get.snackbar("Error", data["error"]);
        res.value = "Error";
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
