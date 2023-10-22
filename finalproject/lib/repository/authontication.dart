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
  static String? iduser;
  static String? idhotel;
  static String? namehotel;
  static String? pricehotel;

  static void login(String Id, String name, String Email, String profile, String Password,
      int Phone,String Per,String Gender,String UName,) {
    isLoggedIn.value = true;
    iduser = Id;
    fName = name;
    email = Email;
    img = profile;
    password = Password;
    uName = UName;
    gender = Gender;
    per = Per;
    phone =Phone;

  }

  static void hotel(String HId,String name, String price){
    isLoggedIn.value = true;

    idhotel = HId;
    namehotel = name;
    pricehotel = price;

  }

  static void logout() {
    isLoggedIn.value = false;
    iduser = null;
  }
}