import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../repository/autho.dart';
import 'package:provider/provider.dart';
import 'Home.dart';

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

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: Center(
              child: Text(
                'Log in',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4,
                ),
              ),
            ),
          ),
          Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: TextFormField(
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
                    maxLength: 30,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColorLight,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.redAccent,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: TextFormField(
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
                    maxLength: 20,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColorLight,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: _isLoading
                      ? Visibility(
                    visible: _isLoading,
                    child: CircularProgressIndicator(),
                  )
                      : TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).primaryColorDark,
                      backgroundColor: Theme.of(context).primaryColor,
                      minimumSize: Size(
                        MediaQuery.of(context).size.width,
                        50,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
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
                          // Login successful
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FooterBar()),
                          );
                        } else {
                          // Login failed
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Login failed')),
                          );
                        }
                      }
                    },
                        child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}