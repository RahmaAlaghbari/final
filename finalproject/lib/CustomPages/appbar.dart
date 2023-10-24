import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../repository/authontication.dart';
import '../views/setting_page.dart';
import '../../CustomPages/snackpar.dart';

AppBar customAppBar(BuildContext context, String title) {
  if (AuthenticationProvider.per == "user") {
    return AppBar(
      elevation: 0,
      backgroundColor: Color(0xFF3A424D),
      title: Text(
        '${title}',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.settings,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );
            // Handle settings button press
          },
        ),
      ],
    );
  } else {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.black,
      title: Text(
        '${title}',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.settings,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );
            // Handle settings button press
          },
        ),
      ],
    );
  }
}

void showErrorSnackbar(BuildContext context, String errorMessage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          Text(
            errorMessage,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
      backgroundColor: Colors.red[400],
      duration: Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}