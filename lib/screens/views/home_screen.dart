import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_ux_project/controllers/auth/get_user.dart';
import 'package:ui_ux_project/screens/views/card.dart';
import 'package:ui_ux_project/utitls/style/colors.dart';
import 'package:ui_ux_project/widgets/home_intro.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map> features = [
    {
      'icon': Icons.home,
      'label': 'Home',
      'image': 'assets/images/pay.jpg',
    },
    {
      'icon': Icons.face,
      'label': 'Profile',
      'image': 'assets/images/com.jpg',
    },
    {
      'icon': Icons.person,
      'label': 'Profile',
      'image': 'assets/images/mony.jpg',
    },
    {
      'icon': Icons.settings,
      'label': 'Setting',
      'image': 'assets/images/send.jpg',
    }
  ];

  GetUser controller = Get.put(GetUser());

  @override
  void initState() {
    super.initState();
    controller.getUser().then(
      (userData) {
        print('User: $userData');
      },
    ).catchError(
      (error) {
        print('Error fetching user: $error');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Column(
        children: [
          HomeIntro(size),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Explore Features',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          'All',
                          style: TextStyle(color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                    GridView.builder(
                      itemCount: features.length,
                      shrinkWrap: true,
                      primary: false,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                      ),
                      itemBuilder: (context, index) {
                        return CardView(
                          image: features[index]['image'],
                          label: features[index]['label'],
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
