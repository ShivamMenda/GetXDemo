import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controllers/user_list_contoller.dart';
import 'package:getx_demo/data/response/status.dart';

class ApiView extends StatefulWidget {
  const ApiView({Key? key}) : super(key: key);

  @override
  State<ApiView> createState() => _ApiViewState();
}

class _ApiViewState extends State<ApiView> {
  UserListController controller = Get.put(UserListController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getUserListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("API View"),
        ),
        body: Obx(() {
          switch (controller.rxRequestStatus.value) {
            case Status.LOADING:
              return Center(child: CircularProgressIndicator());
            case Status.COMPLETED:
              return ListView.builder(
                  itemCount: controller.userList.value.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                          controller.userList.value.data![index].avatar
                              .toString(),
                        )),
                        title: Text(controller
                            .userList.value.data![index].firstName
                            .toString()),
                        subtitle: Text(controller
                            .userList.value.data![index].email
                            .toString()),
                      ),
                    );
                  });
            case Status.ERROR:
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(controller.error.value),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        controller.getUserListApi();
                        controller.rxRequestStatus.value = Status.LOADING;
                      },
                      child: Text("Retry")),
                ],
              );
          }
        }));
  }
}
