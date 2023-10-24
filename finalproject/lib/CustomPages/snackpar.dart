import 'package:flutter/material.dart';

class myerrorsnack {

  static void showErrorSnackbar(BuildContext context, String word) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor:Color(0xFFA76F6F),
        content: Text('${word} Not Found.'),
        duration: Duration(seconds: 2),
      ),
    );
    // Perform logout action here if needed
  }

  static void showSnackbar(BuildContext context,String word) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor:Colors. blueGrey,
        content: Text('${word} Successfully.'),
        duration: Duration(seconds: 2),
      ),
    );
    // Perform logout action here if needed
  }



}