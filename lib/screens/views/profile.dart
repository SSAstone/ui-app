import 'package:flutter/material.dart';
import 'package:ui_ux_project/controllers/auth/get_user.dart';
import 'package:get/get.dart';
import 'package:ui_ux_project/screens/views/from_screen.dart';
import 'package:ui_ux_project/screens/views/profileDetails.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  GetUser controller = Get.put(GetUser());

  Map<String, dynamic> user = {}; 

  @override
  void initState() {
    super.initState();
    controller.getUser().then(
      (userData) {
        setState(() {
          user = userData;
        });
      },
    ).catchError(
      (error) {
        print('Error fetching user: $error');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: user.isNotEmpty
            ? ProfileDetails(user: user)
            : const Login(),
      ),
    );
  }
}
