import 'package:flutter/material.dart';

PreferredSizeWidget CustomAppBar({
  required BuildContext context,
  required String title
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    ),
    title: Text(
      title,
    )
  );
}