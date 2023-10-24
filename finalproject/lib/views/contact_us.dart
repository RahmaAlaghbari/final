import 'package:flutter/material.dart';

import '../CustomPages/appbar.dart';

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   customAppBar(context,'Contact us'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Center(
              child: Text(
                'Get in Touch',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(
                Icons.email,
                color: Colors.blueGrey,
              ),
              title: Text(
                'Email',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('info@example.com'),
              onTap: () {
                // Handle email tapping
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.phone,
                color: Colors.blueGrey,
              ),
              title: Text(
                'Phone',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('+1 123-456-7890'),
              onTap: () {
                // Handle phone tapping
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.location_on,
                color: Colors.blueGrey,
              ),
              title: Text(
                'Address',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('123 Main St, City, Country'),
              onTap: () {
                // Handle address tapping
              },
            ),
          ],
        ),
      ),
    );
  }
}