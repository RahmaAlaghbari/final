import 'package:flutter/material.dart';

import 'MainPages/home_view.dart';
import 'MainPages/login_page.dart';
import 'MainPages/login_service.dart';
import 'MainPages/login_switch_controller.dart';
class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: LoginSwitchController.instance.themeSwitch,
      builder: (context, isDark, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: LoginService().getUser(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                    strokeWidth: 3.0,
                  ),
                );
              case ConnectionState.none:
                return LoginPage();
              default:
                if (snapshot.data != null) {
                  return HomeView(user: snapshot.data!); // Add the null check using '!'
                } else {
                  return LoginPage();
                }
            }
          },
        ),
        theme: ThemeData(brightness: isDark ? Brightness.dark : Brightness.light),
        routes: {
          '/login': (_) => LoginPage(),
        },
      ),
    );
  }
}