import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utitls/style/colors.dart';

Widget HomeIntro(Size size) {
  return Container(
    height: size.height * 0.3,
    width: size.width,
    padding: const EdgeInsets.only(
      left: 20,
      right: 20,
      top: 56,
    ),
    decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primaryColor, AppColors.secondaryColor],
          end: Alignment.topLeft,
          begin: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        )),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello,",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Welcome to my Record App',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: const Stack(
                children: [
                  Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // TextFormField(
        //   decoration: InputDecoration(
        //     contentPadding: const EdgeInsets.all(0),
        //     fillColor: Colors.white,
        //     filled: true,
        //     prefixIcon: const Icon(Icons.search),
        //     hintText: 'Search',
        //     hintStyle: const TextStyle(color: Colors.black),
        //     suffixIcon: const Icon(Icons.mic),
        //     border: OutlineInputBorder(
        //       borderRadius: BorderRadius.circular(30.0),
        //       borderSide: const BorderSide(
        //         width: 0,
        //         style: BorderStyle.none,
        //       ),
        //     ),
        //   ),
        // ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.white,
          ),
          child: TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.black),
              border: InputBorder.none,
              suffixIcon: Icon(Icons.mic),
            ),
          ),
        ),
      ],
    ),
  );
}
