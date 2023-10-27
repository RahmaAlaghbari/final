import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:project4/views/favorit.dart';
import 'package:project4/views/profile/personal_info%20page.dart';
import 'package:project4/views/reservation/my_reservation.dart';

import '../../CustomPages/appbar.dart';
import '../../repository/authontication.dart';
import '../login/login_page.dart';
import 'edit_profil.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(52, 36, 25, 1.0),
                Color.fromRGBO(219, 177, 149, 0.6901960784313725),
              ],
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
            ),
          ),
        ),
        Scaffold(

          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 73),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {

                          Navigator.of(context).pop();
                          // Handle onTap for the first icon (AntDesign.arrowleft)
                        },
                        child: Icon(
                          AntDesign.arrowleft,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          AuthenticationProvider.logout();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                                (route) => false,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor:Colors.brown[200],
                              content: Text('Logged out successfully.'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                          // Handle onTap for the second icon (AntDesign.logout)
                        },
                        child: Icon(
                          AntDesign.logout,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'My\nProfile',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontFamily: 'Nisebuschgardens',
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Container(
                    height: height * 0.43,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double innerHeight = constraints.maxHeight;
                        double innerWidth = constraints.maxWidth;
                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: innerHeight * .93,
                                width: innerWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 80,
                                    ),
                                    Text(
                                      '${AuthenticationProvider.fName}',
                                      style: TextStyle(
                                        color: Colors.brown[300],
                                        fontFamily: 'Nunito',
                                        fontSize: 37,
                                      ),
                                    ),
                                    Text(
                                      '@${AuthenticationProvider.uName}',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(height: 16.0),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => PersonalInfoPage()),);
                                        // Navigate to edit profile screen
                                      },
                                      child: Text(
                                        'Personal Information',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.brown[200],
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        padding: EdgeInsets.symmetric(vertical: 16.0),
                                        minimumSize: Size(200, 60),
                                      ),
                                    ),
                                    SizedBox(height: 16.0),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'Favorite',
                                              style: TextStyle(
                                                color: Colors.grey[700],
                                                fontFamily: 'Nunito',
                                                fontSize: 20,
                                              ),
                                            ),
                                            Text(
                                              '10',
                                              style: TextStyle(
                                                color: Colors.brown[200],
                                                fontFamily: 'Nunito',
                                                fontSize: 19,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 25,
                                            vertical: 8,
                                          ),
                                          child: Container(
                                            height: 50,
                                            width: 3,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              'My Reservation',
                                              style: TextStyle(
                                                color: Colors.grey[700],
                                                fontFamily: 'Nunito',
                                                fontSize: 20,
                                              ),
                                            ),
                                            Text(
                                              '1',
                                              style: TextStyle(
                                                color: Colors.brown[200],
                                                fontFamily: 'Nunito',
                                                fontSize: 19,
                                              ),
                                            ),

                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 110,
                              right: 20,
                              child: GestureDetector(
                                onTap: () {

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => userUpdate(userId: '${AuthenticationProvider.iduser}',)),);

                                  // Handle onTap for the Icon (AntDesign.edit)
                                },
                                child: Icon(
                                  AntDesign.edit,
                                  color: Colors.grey[700],
                                  size: 30,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Container(
                                  width: innerWidth * 0.45,
                                  child: ClipOval(
                                    child: Image.asset(
                                      '${AuthenticationProvider.img}',
                                      width: 10,
                                      height: 150,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: height * 0.22,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: height * 0.08,
                            decoration: BoxDecoration(
                              color: Colors.brown[200],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => MyReservations()));

                                // Handle onTap for the Container
                              },
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                    child: Icon(
                                      Icons.business,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'My Reservation',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: height * 0.08,
                            decoration: BoxDecoration(
                              color: Colors.brown[200],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: GestureDetector(
                              onTap: () {

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Myfav()));

                                // Handle onTap for the Container
                              },
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'My Favorite',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
