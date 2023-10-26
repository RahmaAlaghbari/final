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
  static String? avatarhotel;
  static String? descriptionhotel;
  static String? locationhotel;
  static String? cathotel;
  static String? descnmaehotel;



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

  static void hotel(String HId
      ,String name, String price, String img ,String Desc ,String loca ,String cat , String DescName
      ){
    isLoggedIn.value = true;

    idhotel = HId;
    namehotel = name;
    pricehotel = price;
    avatarhotel =img;
    descriptionhotel = Desc;
    locationhotel = loca;
    cathotel = cat;
    descnmaehotel = DescName;
  }

  static void logout() {
    isLoggedIn.value = false;
    iduser = null;
  }
}