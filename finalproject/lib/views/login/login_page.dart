import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project4/views/login/signup.dart';
import 'package:provider/provider.dart';

import '../../repository/authontication.dart';
import '../../repository/login_repo.dart';
import '../Home.dart';
import '../dashboard/dashboard.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _isSubmitPressed = false;


  @override
  Widget build(BuildContext context) {

    AuthenticationProviderr authProvider =
    Provider.of<AuthenticationProviderr>(context, listen: false);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            Container(
              padding: EdgeInsets.only(left: 35, top: 130),
              child: Text(
                'Welcome\nBack',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 35, right: 35),
                        child: Column(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              autovalidateMode: _isSubmitPressed
                                  ? AutovalidateMode.disabled
                                  : AutovalidateMode.onUserInteraction,
                              controller: _emailController,
                              validator: (value) {
                                RegExp emailRegex =
                                RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                                if (value == null) {
                                  return 'Email is required';
                                } else if (value.length < 10) {
                                  return 'Email must be more than 10 characters';
                                } else if (!value.contains('@')) {
                                  return 'Email must contain @';
                                } else if (!emailRegex.hasMatch(value)) {
                                  return 'Invalid email';
                                }

                                return null;
                              },

                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: "Email",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(

                              style: TextStyle(),
                              obscureText: true,
                              controller: _passwordController,
                              autovalidateMode: _isSubmitPressed
                                  ? AutovalidateMode.disabled
                                  : AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null) {
                                  return 'Password is required';
                                } else if (value.length < 3) {
                                  return 'Password must be more than 3 characters';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                focusColor: Color(0xFFA76F6F),
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Color(0xFFA76F6F), width: 1),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sign in',
                                  style: TextStyle(
                                      fontSize: 27, fontWeight: FontWeight.w700),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color(0xFFA76F6F),
                                  child: _isLoading ? Visibility(
                                    visible: _isLoading,
                                    child: CircularProgressIndicator(),

                                  ) :  IconButton(
                                      color: Colors.white,
                                      onPressed: () async {
                                        if (formKey.currentState!.validate()) {
                                          setState(() {
                                            _isLoading = true;
                                            _isSubmitPressed = true;
                                          });

                                          print("########################");

                                          // // Call the login method from the AuthenticationProvider
                                          bool loginSuccess = await authProvider.login(
                                            _emailController.text,
                                            _passwordController.text,
                                          );
                                          print("########################$loginSuccess");

                                          if (loginSuccess) {
                                            if(AuthenticationProvider.per=="user") {
                                              // Login successful
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        FooterBar()),
                                              );
                                            }

                                            else if(AuthenticationProvider.per=="admin"){
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DashboardPage()),
                                              );
                                            }
                                          } else {
                                            // Login failed
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(content: Text('Login failed')),
                                            );
                                          }
                                        }
                                      },
                                      icon: Icon(
                                        Icons.arrow_forward,
                                      )),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => SignUpPage()),
                                    );
                                  },
                                  child: Text(
                                    'Sign Up',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Color(0xff4c505b),
                                        fontSize: 18),
                                  ),
                                  style: ButtonStyle(),
                                ),
                                TextButton(
                                    onPressed: () {
                                    },
                                    child: Text(
                                      'Forgot Password',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Color(0xff4c505b),
                                        fontSize: 18,
                                      ),
                                    )),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
