
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project4/views/profile/profile_page.dart';
import 'package:project4/views/reservation/my_reservation.dart';

import '../CustomPages/drawerScreen.dart';

import 'hotel/Hotels_page.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          //
          // ProfilePage(),
          // CompAdd(),
          // Myfav(),
          // MyReservations(),
          HotelCardh(),


        ],
      ),

    );
  }
}
