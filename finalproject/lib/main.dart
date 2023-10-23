import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project4/views/profile/profile_page.dart';
import 'package:provider/provider.dart';
import 'repository/login_repo.dart';
import 'views/login/login_page.dart';
import 'views/setting_page.dart';

//hi rahma :)👵🕵️‍♀️
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => AuthenticationProviderr(Dio()), // Create an instance of the AuthenticationProvider
      child: MaterialApp(
        title: 'Booking Hotels',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
        //home: ProfilePage(),
        //home: ProfilePage(),
        //home: FooterBar(),
        //home:HotelColumn(),
        //home: SettingsPage(),

      ),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  void _incrementCounter() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),

    );
  }
}