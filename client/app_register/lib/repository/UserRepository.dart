import 'dart:convert';
import 'package:app_register/Util/Settings.dart';
import 'package:app_register/models/api/Response.dart';
import 'package:app_register/models/api/user/list/UserResponse.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  static String urlSendDataToServer = 'http://64.0.7.121:3000/postData/';
  static String urlGetAllUser = "http://64.0.7.121:3000/getData";

  static Future sendDataToServer(Map<String, dynamic> user) async {
    try {
      final response = await http
          .post(Uri.encodeFull(urlSendDataToServer), body: user)
          .timeout(Duration(seconds: AppConfig.timeOutDuration));
      print(response.body);

      if (response.statusCode == 200) {
        return Response.fromMap(json.decode(response.body));
      } else {
        throw Exception("failed to post user info");
      }
    } catch (e) {
      return e.message;
    }
  }

  static Future<GetAllUserResponse> getAllUser() async {
    try {
      final response = await http
          .get(Uri.encodeFull(urlGetAllUser))
          .timeout(Duration(seconds: AppConfig.timeOutDuration));

      if (response.statusCode == 200) {
        return GetAllUserResponse.fromMap(json.decode(response.body));
      } else {
        throw Exception("failed to get List:getAllUser");
      }
    } catch (e) {
      return e.message;
    }
  }
}
