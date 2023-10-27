import 'package:flutter/material.dart';
import 'package:project4/repository/authontication.dart';
import '../views/login/login_page.dart';
import '../views/setting_page.dart';
import 'configuration.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown[300],
      padding: EdgeInsets.only(top:50,bottom: 70,left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${AuthenticationProvider.fName}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  Text('@${AuthenticationProvider.uName}',style: TextStyle(color: Colors.brown[100],))
                ],
              )
            ],
          ),

          Column(
            children: drawerItems.map((element) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => element['page']),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      element['icon'],
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(width: 15),
                    Text(
                      element['title'],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            )).toList(),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPage()),);
                  // Handle onTap for the Settings text
                },
                child: Row(
                  children: [
                    Icon(Icons.settings, color: Colors.white),
                    SizedBox(width: 10),
                    Text('Settings', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Container(width: 2, height: 20, color: Colors.white),
              SizedBox(width: 10),
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
                  // Handle onTap for the Log out text
                },
                child: Text('Log out', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ],
          )


        ],
      ),

    );
  }
}
