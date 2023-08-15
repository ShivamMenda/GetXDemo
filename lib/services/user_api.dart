import 'package:getx_demo/data/network/network_api_services.dart';
import 'package:getx_demo/models/user_list_model.dart';

class UserAPIRepo {
  final _apiService = NetworkApiServices();
  Future<UserListModel> userListAPI(int page, int per_page) async {
    dynamic response = await _apiService
        .getAPI("https://reqres.in/api/users?page=$page&per_page=$per_page");
    return UserListModel.fromJson(response);
  }
}
