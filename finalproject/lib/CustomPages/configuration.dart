import 'package:flutter/material.dart';
import 'package:project4/views/add_comp.dart';
import 'package:project4/views/profile/profile_page.dart';

import '../views/favorit.dart';
import '../views/hotel/Hotels_page.dart';
import '../views/profile/ProfileScreen.dart';
import '../views/reservation/my_reservation.dart';

Color primaryGreen = Color(0xff416d6d);
List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey, blurRadius: 30, offset: Offset(0, 10))
];


List<Map> drawerItems=[


  {
    'icon': Icons.receipt_long_sharp,
    'title' : 'Reservation',
    'page' : MyReservations()
  },
  {
    'icon': Icons.favorite,
    'title' : 'Favorites',
  'page' : Myfav()


  },
  {
    'icon': Icons.mail,
    'title' : 'Complaints',
  'page' : CompAdd()

  },
  {
    'icon': Icons.person,
    'title' : 'Profile',
  'page' : ProfileScreen()

  },
];