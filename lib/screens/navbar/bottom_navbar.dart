import 'package:flutter/material.dart';
import 'package:ui_ux_project/screens/views/home_screen.dart';
import 'package:ui_ux_project/screens/views/profile.dart';
import 'package:ui_ux_project/utitls/style/colors.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int currentIndex = 0;

  List<Map> navItems = [
    {
      'icon': Icons.home,
      'label': 'Home',
    },
    {
      'icon': Icons.menu_open,
      'label': 'Menu',
    },
    {
      'icon': Icons.person,
      'label': 'Profile',
    },
    {
      'icon': Icons.settings,
      'label': 'Setting',
    }
  ];

  List<Widget> screen = [
    const HomeScreen(),
    const Text('Menu'),
    const Profile(),
    const Text('Setting')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (value) => setState(() => currentIndex = value),
        items: navItems.map((e) {
          return BottomNavigationBarItem(
            icon: Icon(
              e['icon'],
            ),
            label: e['label'],
          );
        }).toList(),
      ),
    );
  }
}
