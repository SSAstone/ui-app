import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:ui_ux_project/utitls/api/api_endpoints.dart';

class GetUser extends GetxController {
  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final res = await http.get(
      Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.getUser),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${prefs.getString('token')}'
      },
    );
    return jsonDecode(res.body)['data'];
  }
  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }
}