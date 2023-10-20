import 'package:flutter/material.dart';

class AuthenticationProvider {
  static ValueNotifier<bool> isLoggedIn = ValueNotifier(false);
  static String? fName;
  static String? img;
  static String? uName;
  static String? password;
  static int? phone;
  static String? per;
  static String? gender;
  static String? email;
  static String? id;
  static String? idhotel;

  static void login(String Id, String name, String Email, String profile, String Password,
      int Phone,String Per,String Gender,String UName,) {
    isLoggedIn.value = true;
    id= Id;
    fName = name;
    email = Email;
    img = profile;
    password=Password;
    uName=UName;
    gender =Gender;
    per = Per;
    phone =Phone;

  }

  static void hotelid(String Id){
    isLoggedIn.value = true;

    idhotel=Id;

  }



  static void logout() {
    isLoggedIn.value = false;
    id = null;
  }
}