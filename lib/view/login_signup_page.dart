import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controllers/login_controller.dart';

class LoginSignupPage extends StatefulWidget {
  const LoginSignupPage({Key? key}) : super(key: key);

  @override
  State<LoginSignupPage> createState() => _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage> {
  LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login/Signup"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: controller.emailController.value,
              decoration: InputDecoration(hintText: "Email"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: controller.passwordController.value,
              decoration: InputDecoration(hintText: "Password"),
            ),
          ),
          MaterialButton(
            color: Colors.blue,
            onPressed: () {
              controller.loginAPI();
            },
            child: Text("Login"),
          ),
          Obx(
            () => Text(controller.res.toString()),
          ),
        ],
      ),
    );
  }
}
