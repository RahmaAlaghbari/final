import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../CustomPages/appbar.dart';
import '../../repository/authontication.dart';
import 'edit_profil.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({Key? key}) : super(key: key);

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPage();
}


class _PersonalInfoPage extends State<PersonalInfoPage>  {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
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
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 40),
                CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('${AuthenticationProvider.img}'),
                ),
                const SizedBox(height: 20),
            itemProfile('Name', '${AuthenticationProvider.fName}', CupertinoIcons.person),
            const SizedBox(height: 10),
            itemProfile('User Name', '@${AuthenticationProvider.uName}', CupertinoIcons.person),
            const SizedBox(height: 10),
            itemProfile('Phone', '${AuthenticationProvider.phone}', CupertinoIcons.phone),
            const SizedBox(height: 10),
            itemProfile('Gender', '${AuthenticationProvider.gender}', CupertinoIcons.person_2),
            const SizedBox(height: 10),
            itemProfile('Email', '${AuthenticationProvider.email}', CupertinoIcons.mail),
            const SizedBox(height: 20,),
            SizedBox(
              width: 200,
              child:ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => userUpdate(userId: '${AuthenticationProvider.iduser}',)),);
                  // Navigate to edit profile screen
                },
                child: Text(
                  'Edit Info',
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
            )
          ],
        ),
    )],),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),


      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        tileColor: Colors.white,
      ),
    );
  }
}