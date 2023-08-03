import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/ui/image_picker_page.dart';
import 'package:getx_demo/ui/login_signup_page.dart';
import 'package:getx_demo/ui/state_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "GetX Utils",
      )),
      body: Column(
        children: [
          Card(
            child: ListTile(
              title: const Text("GetX Dialog Alert"),
              subtitle: const Text("Dialog"),
              onTap: () {
                Get.defaultDialog(
                    title: "Delete Chat",
                    middleText: "Are you sure?",
                    contentPadding: const EdgeInsets.all(20),
                    titlePadding: const EdgeInsets.only(top: 20),
                    textCancel: "No",
                    textConfirm: "Yes");
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text("GetX Bottom Sheet"),
              subtitle: const Text("Theme Change"),
              onTap: () {
                Get.bottomSheet(Container(
                  color: Colors.amber,
                  child: Column(children: [
                    ListTile(
                      leading: const Icon(Icons.light_mode),
                      title: const Text("Light Theme"),
                      onTap: () {
                        Get.changeTheme(ThemeData.light());
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.dark_mode),
                      title: const Text("Dark Theme"),
                      onTap: () {
                        Get.changeTheme(ThemeData.dark());
                      },
                    ),
                  ]),
                ));
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => StatePage());
            },
            child: Text("State Page"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => ImagePickerPage());
            },
            child: Text("Image Picker Page"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => LoginSignupPage());
            },
            child: Text("Login/Signup Page"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.snackbar(
            "Test",
            "Testing",
            backgroundColor: const Color.fromARGB(157, 244, 67, 54),
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
          ); //Get Snackbar
        },
        child: Icon(Icons.warning),
      ),
    );
  }
}
