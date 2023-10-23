import 'package:flutter/material.dart';

import '../../../models/user_model.dart';
import '../../../repository/user_repo.dart';

String? selectedGender;
final genderList = ['female', 'male','others'];


class Edit_Profil extends StatefulWidget {
  final String userId;

  Edit_Profil({required this.userId});

  @override
  _Edit_Profil createState() => _Edit_Profil();
}

class _Edit_Profil extends State<Edit_Profil> {
  final _formKey = GlobalKey<FormState>();
  final _UserRepository = UserRepository();
  TextEditingController _fNameController = TextEditingController();
  TextEditingController _imgController = TextEditingController();
  TextEditingController _uNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _perController = TextEditingController();

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
        _genderController.text = user.gender!;
        _emailController.text = user.email!;
        _perController.text = user.per!;

      }
    } catch (e) {
      // Handle any errors
      print('Error loading user: $e');
    }
  }

  void _updateProfil() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Retrieve the existing user data
        UserModel? existingUser = await _UserRepository.getById(widget.userId);
        if (existingUser != null) {
          // Create a new UserModel object with the updated permission
          UserModel updatedUser = UserModel(
            id: existingUser.id,
            fName: existingUser.fName,
            img: existingUser.img,
            uName: existingUser.uName,
            password: existingUser.password,
            phone: existingUser.phone,
            gender: existingUser.gender,
            email: existingUser.email,
            per: existingUser.per,
          );

          // Update the user with the new permission
          Object rowsAffected = await _UserRepository.editt(updatedUser);
          if (rowsAffected != true) {
            // User updated successfully
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('profil updated successfully')),
            );
            Navigator.of(context).pop(true);
          } else {
            // Failed to update user
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Failed to update profil')),
            );
          }
        }
      } catch (e) {
        // Handle any errors
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error updating profil')),
        );
      }
    }
  }

  @override
  void dispose() {
    _fNameController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _genderController.dispose();
    _emailController.dispose();
    _imgController.dispose();
    _uNameController.dispose();
    _perController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Profil'),
      ),
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
                    decoration: InputDecoration(labelText: 'Full Name'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _imgController,
                    decoration: InputDecoration(labelText: 'img'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter img';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _uNameController,
                    decoration: InputDecoration(labelText: 'User Name'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter an User Name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: 'password'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _phoneController,
                    decoration: InputDecoration(labelText: 'phone number'),
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
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a Email';
                      }

                      return null;
                    },
                  ),


                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _updateProfil,
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
