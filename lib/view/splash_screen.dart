import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/data/app_exceptions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          Get.toNamed('/home_screen');
        },
        child: Text("Home Screen"),
      )),
      floatingActionButton: FloatingActionButton(onPressed: () {
        throw InternetExceptions("");
      }),
    );
  }
}
