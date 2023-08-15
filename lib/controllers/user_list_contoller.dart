import 'package:get/get.dart';
import 'package:getx_demo/data/response/status.dart';
import 'package:getx_demo/models/user_list_model.dart';
import 'package:getx_demo/services/user_api.dart';

class UserListController extends GetxController {
  final api = UserAPIRepo();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = UserListModel().obs;
  final error = "".obs;

  void setRequestStatus(Status _value) {
    rxRequestStatus.value = _value;
  }

  void setUserList(UserListModel _value) {
    userList.value = _value;
  }

  void setError(String _value) {
    error.value = _value;
  }

  void getUserListApi() {
    api.userListAPI(2, 6).then((value) {
      setRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      setRequestStatus(Status.ERROR);
      setError(error.toString());
    });
  }
}
