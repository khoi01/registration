import 'dart:convert';
import 'package:app_register/models/api/Response.dart';
import 'package:app_register/models/api/user/list/UserResponse.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  static String urlSendDataToServer = 'http://192.168.1.107:3000/postData/';
  static String urlGetAllUser = "http://192.168.1.107:3000/getData";

  static Future sendDataToServer(Map<String, dynamic> user) async {
    final server =
        await http.post(Uri.encodeFull(urlSendDataToServer), body: user);

    if (server.statusCode == 200) {
      return Response.fromMap(json.decode(server.body));
    } else {
      throw Exception("failed to post user info");
    }
  }

  static Future<GetAllUserResponse> getAllUser() async {
    
    final response = await http.get(Uri.encodeFull(urlGetAllUser));

    if (response.statusCode == 200) {
      return GetAllUserResponse.fromMap(json.decode(response.body));
    } else {
      throw Exception("failed to get List:getAllUser");
    }
  }
}
