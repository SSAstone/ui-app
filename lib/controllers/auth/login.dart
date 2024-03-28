import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_ux_project/screens/navbar/bottom_navbar.dart';
import 'package:ui_ux_project/utitls/api/api_endpoints.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  void login() async {
    try {
      Map body = {
        'username_email': emailController.value.text,
        'password': passwordController.value.text
      };
      http.Response res = await http.post(
        Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.login),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      if (res.statusCode == 201) {
        Map<String, dynamic> resBody = jsonDecode(res.body);
        String token = resBody['data']['accessToken'];
        try {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', token.toString());
          print('Token stored successfully');
        } catch (e) {
          print('Error storing token: $e');
        }

        Get.snackbar('Success', 'Login Successful');

        emailController.value.clear();
        passwordController.value.clear();

        Get.offAll(() => const BottomNavbar());
      } else {
        Map<String, dynamic> errorBody = jsonDecode(res.body);
        String errorMessage = errorBody['message'];
        Get.snackbar('Error', errorMessage);
      }
    } catch (e) {
      print(e);
    }
  }

  
}
