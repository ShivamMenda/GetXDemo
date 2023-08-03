import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controllers/counter_controller.dart';

class StatePage extends StatefulWidget {
  const StatePage({Key? key}) : super(key: key);

  @override
  State<StatePage> createState() => _StatePageState();
}

class _StatePageState extends State<StatePage> {
  final CounterController controller = Get.put(CounterController());
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GetX State Management")),
      body: Center(
        child: Obx(() {
          return Text(
            controller.counter.toString(),
            style: TextStyle(fontSize: 60),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        // counter++;
        // setState(() {}); // To Costly it rebuilds the whole page a lot.
        // State Management only rebuilds the widgets required, Saves Memory.
        controller.inc();
      }),
    );
  }
}
