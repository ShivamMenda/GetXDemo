import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "GetX Utils",
      )),
      body: Column(
        children: [
          Card(
            child: ListTile(
              title: Text("GetX Dialog Alert"),
              subtitle: Text("Dialog"),
              onTap: () {
                Get.defaultDialog(
                    title: "Delete Chat",
                    middleText: "Are you sure?",
                    contentPadding: EdgeInsets.all(20),
                    titlePadding: EdgeInsets.only(top: 20),
                    textCancel: "No",
                    textConfirm: "Yes");
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text("GetX Bottom Sheet"),
              subtitle: Text("Bottom"),
              onTap: () {
                Get.bottomSheet(Container(
                  color: Colors.amber,
                  child: Column(children: [
                    ListTile(
                      leading: Icon(Icons.light_mode),
                      title: Text("Light Theme"),
                      onTap: () {
                        Get.changeTheme(ThemeData.light());
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.dark_mode),
                      title: Text("Dark Theme"),
                      onTap: () {
                        Get.changeTheme(ThemeData.dark());
                      },
                    ),
                  ]),
                ));
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.snackbar(
          "Test",
          "Testing",
          backgroundColor: const Color.fromARGB(157, 244, 67, 54),
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        ); //Get Snackbar
      }),
    );
  }
}
