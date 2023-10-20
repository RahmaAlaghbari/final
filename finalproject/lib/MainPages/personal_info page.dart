import 'package:flutter/material.dart';

void main() {
  runApp(PersonalInfoPage());
}

class PersonalInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Info Page',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Personal Info',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(30.0), // Adjust padding to match the style
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name',
                style: TextStyle(
                  fontSize: 25.0, // Increase font size
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Rahma Alaghbari',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              Divider(
                color: Colors.blueGrey, // Change divider color
                thickness: 1.0, // Add thickness to divider
              ),
              SizedBox(height: 40.0), // Increase spacing
              Text(
                'Contact Information',
                style: TextStyle(
                  fontSize: 25.0, // Increase font size
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Email: rahma.doe@example.com',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Phone: (123) 456-7890',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              Divider(
                color: Colors.blueGrey, // Change divider color
                thickness: 1.0, // Add thickness to divider
              ),
              SizedBox(height: 40.0), // Increase spacing
              Text(
                'ID',
                style: TextStyle(
                  fontSize: 25.0, // Increase font size
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                '12345677890',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),



              // Add more work experience entries as needed
              SizedBox(height: 40.0), // Increase spacing
              ElevatedButton(
                onPressed: () {
                  // Add your edit info functionality here
                  print('Edit Info button pressed');
                },
                child: Text(
                  'Edit Info',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  minimumSize: Size(400, 40), // Increase button size
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}