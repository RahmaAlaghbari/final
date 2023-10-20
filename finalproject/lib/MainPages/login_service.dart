// import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/user_model.dart';
import 'login_interface.dart';
Dio dio =Dio();
class LoginService extends ILogin {
  @override
  Future<UserModel?> login(String? email, String? password) async {
    final api = 'https://65253db067cfb1e59ce6f039.mockapi.io/hotelusers/users';
    final data = {"email": email, "password": password};
    // final dio = Dio();
    http.Response response;
    response = (await dio.post(api, data: data)) as http.Response;
    if (response.statusCode == 200) {
      SharedPreferences storage = await SharedPreferences.getInstance();
      final body = json.decode(response.body);
      await storage.setString('password', body['password']);
      await storage.setString('email', email??"");
      return UserModel(email: email, password: body['password']);
    } else {
      return null;
    }
  }

  @override
  Future<UserModel?> getUser() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    final password = storage.getString('password');
    final email = storage.getString('email');
    if (password != null && email != null) {
      return UserModel(email: email, password: password);
    } else {
      return null;
    }
  }

  @override
  Future<bool> logout() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    final email = storage.getString('email');
    final password = storage.getString('password');
    if (email != null && password != null) {
      await storage.remove('passworg');
      await storage.remove('email');
      return true;
    } else {
      return false;
    }
  }
}
