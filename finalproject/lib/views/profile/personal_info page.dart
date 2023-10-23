import 'package:flutter/material.dart';

import '../../repository/authontication.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({Key? key}) : super(key: key);

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPage();
}


class _PersonalInfoPage extends State<PersonalInfoPage>  {
  @override
  Widget build(BuildContext context) {
    return

      RefreshIndicator(
        onRefresh: ()async{
      setState(() {

      });
    },

      child:MaterialApp(
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
                '${AuthenticationProvider.fName}',
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
                '${AuthenticationProvider.email}',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                '${AuthenticationProvider.phone}',
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
                'Gender',
                style: TextStyle(
                  fontSize: 25.0, // Increase font size
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                '${AuthenticationProvider.gender}',
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
    )
      );
  }
}