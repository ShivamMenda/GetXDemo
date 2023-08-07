import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controllers/image_picker_controller.dart';

class ImagePickerPage extends StatefulWidget {
  ImagePickerPage({Key? key}) : super(key: key);

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  ImagePickerController controller = Get.put(ImagePickerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("GetX Image Picker"),
        ),
        body: Obx(() => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                      radius: 40,
                      backgroundImage: controller.imagePath.isNotEmpty
                          ? FileImage(File(controller.imagePath.toString()))
                          : null),
                  TextButton(
                      onPressed: () {
                        controller.getImage();
                      },
                      child: Text("Pick Image"))
                ],
              ),
            )));
  }
}
