import 'package:flutter/material.dart';

import '../../../models/user_model.dart';
import '../../../repository/user_repo.dart';
import '../../CustomPages/appbar.dart';


String? selectedGender;
final genderList = ['female', 'male','others'];


class userUpdate extends StatefulWidget {
  final String userId;

  userUpdate({required this.userId});

  @override
  _userUpdate createState() => _userUpdate();
}

class _userUpdate extends State<userUpdate> {
  final _formKey = GlobalKey<FormState>();
  final _UserRepository = UserRepository();
  TextEditingController _perController = TextEditingController();
  TextEditingController _fNameController = TextEditingController();
  TextEditingController _imgController = TextEditingController();
  TextEditingController _uNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  bool isError = false;
  String errorMsg = "";

  @override
  void initState() {
    super.initState();
    // Load the Product data by ID when the page is initialized
    _loadUser();
  }

  void _loadUser() async {
    try {
      // Retrieve the Product by ID
      UserModel? user =
      await _UserRepository.getById(widget.userId);
      if (user != null) {
        _fNameController.text = user.fName!;
        _imgController.text = user.img!;
        _uNameController.text = user.uName!;
        _passwordController.text = user.password!;
        _phoneController.text = user.phone! as String;
        _perController.text = user.per!;
        _genderController.text = user.gender!;
        _emailController.text = user.email!;

      }
    } catch (e) {
      // Handle any errors
      print('Error loading user: $e');
    }
  }

  void _updateUser() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Retrieve the existing user data
        UserModel? existingUser = await _UserRepository.getById(widget.userId);
        if (existingUser != null) {
          // Create a new UserModel object with the updated permission
          UserModel updatedUser = UserModel(
            id: widget.userId,
            per: existingUser.per,
            fName: _fNameController.text,
            img: _imgController.text,
            uName: _uNameController.text,
            password: _passwordController.text,
            phone: int.parse(_phoneController.text),
            gender: _genderController.text,
            email: _emailController.text,
          );

          // Update the user with the new permission
          Object rowsAffected = await _UserRepository.editt(updatedUser);
          if (rowsAffected != true) {
            // User updated successfully
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('User updated successfully')),
            );
            Navigator.of(context).pop(true);
          } else {
            // Failed to update user
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Failed to update user')),
            );
          }
        }
      } catch (e) {
        // Handle any errors
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error updating user')),
        );
      }
    }
  }

  @override
  void dispose() {
    _perController.dispose();
    _fNameController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _genderController.dispose();
    _emailController.dispose();
    _imgController.dispose();
    _uNameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   customAppBar(context,'Edit Profile'),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _fNameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Full Name",
                      labelText: "Full Name",
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      counterText: "20",
                      border:
                      OutlineInputBorder(borderSide:BorderSide(color: Colors.amber),
                          borderRadius: BorderRadius.circular(20)),
                      errorBorder:  OutlineInputBorder(borderSide:BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(20)),



                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _imgController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "img",
                      labelText: "img",
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      counterText: "20",
                      border:
                      OutlineInputBorder(borderSide:BorderSide(color: Colors.amber),
                          borderRadius: BorderRadius.circular(20)),
                      errorBorder:  OutlineInputBorder(borderSide:BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(20)),



                    ),                    validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter img';
                    }
                    return null;
                  },
                  ),
                  TextFormField(
                    controller: _uNameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "User Name",
                      labelText: "User Name",
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      counterText: "20",
                      border:
                      OutlineInputBorder(borderSide:BorderSide(color: Colors.amber),
                          borderRadius: BorderRadius.circular(20)),
                      errorBorder:  OutlineInputBorder(borderSide:BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(20)),



                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter an User Name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      counterText: "20",
                      border:
                      OutlineInputBorder(borderSide:BorderSide(color: Colors.amber),
                          borderRadius: BorderRadius.circular(20)),
                      errorBorder:  OutlineInputBorder(borderSide:BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(20)),



                    ),                    validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                  ),
                  TextFormField(
                    controller: _phoneController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Phone Number",
                      labelText: "Phone Number",
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      counterText: "20",
                      border:
                      OutlineInputBorder(borderSide:BorderSide(color: Colors.amber),
                          borderRadius: BorderRadius.circular(20)),
                      errorBorder:  OutlineInputBorder(borderSide:BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(20)),



                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a phone number';
                      }
                      return null;
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: DropdownButtonFormField<String>(
                      value: selectedGender,
                      onChanged: (newValue) {
                        setState(() {
                          selectedGender = newValue;
                          _genderController.text = newValue ?? '';
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'gender',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      items: genderList.map((gender) {
                        return DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                        );
                      }).toList(),
                    ),
                  ),


                  TextFormField(
                    controller: _emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Email",
                      labelText: "Email",
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      counterText: "20",
                      border:
                      OutlineInputBorder(borderSide:BorderSide(color: Colors.amber),
                          borderRadius: BorderRadius.circular(20)),
                      errorBorder:  OutlineInputBorder(borderSide:BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(20)),



                    ),                    validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a Email';
                    }

                    return null;
                  },
                  ),



                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _updateUser,
                    child: Text('Update'),
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}