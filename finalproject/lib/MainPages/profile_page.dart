import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:project4/CustomPages/appbar.dart';
import 'package:project4/MainPages/personal_info%20page.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60.0, left: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/aa.png'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Rahma',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '@Ra7ma',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to edit profile screen
              },
              child: Text(
                'Edit Profile',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 16.0),
                minimumSize: Size(200, 60),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'Favorite',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      '10',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Reservation',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      '5',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Divider(),
            ListTile(
              leading: Icon(Icons.portrait_rounded),
              title: Text(
                'Personal Info',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PersonalInfoPage()),
                );

                // Navigate to personalization settings screen
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.credit_card,
              ),
              title: Text(
                'Payment Methods',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              onTap: () {
                // Empty function, no page navigation
              },
            ),


          ],
        ),
      ),
    );
  }

}