import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:getx_demo/data/app_exceptions.dart';
import 'package:getx_demo/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getAPI(String url) async {
    dynamic responseJSON;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJSON = returnResponse(response);
    } on SocketException {
      throw InternetExceptions("");
    } on TimeoutException {
      throw RequestTimeoutExceptions("");
    }
    return responseJSON;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJSON = jsonDecode(response.body);
        return responseJSON;
      case 400:
        throw InvalidUrlExceptions("");
      default:
        throw FetchDataExceptions("");
    }
  }
  @override
  Future<dynamic> postAPI(var data,String url) async {
    dynamic responseJSON;
    try {
      final response =
          await http.post(Uri.parse(url),body: jsonEncode(data)).timeout(const Duration(seconds: 10));
      responseJSON = returnResponse(response);
    } on SocketException {
      throw InternetExceptions("");
    } on TimeoutException {
      throw RequestTimeoutExceptions("");
    }
    return responseJSON;
  }
}
