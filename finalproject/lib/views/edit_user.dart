import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../repository/user_repo.dart';
String? selectedPermission;
final permissionList = ['admin', 'user'];


class UserUpdate extends StatefulWidget {
  final String userId;

  UserUpdate({required this.userId});

  @override
  _UserUpdate createState() => _UserUpdate();
}

class _UserUpdate extends State<UserUpdate> {
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
            id: existingUser.id,
            per: _perController.text,
            fName: existingUser.fName,
            img: existingUser.img,
            uName: existingUser.uName,
            password: existingUser.password,
            phone: existingUser.phone,
            gender: existingUser.gender,
            email: existingUser.email,
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
      appBar: AppBar(
        title: Text('Update User'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: DropdownButtonFormField<String>(
                      value: selectedPermission,
                      onChanged: (newValue) {
                        setState(() {
                          selectedPermission = newValue; // Update the selected permission value
                          _perController.text = newValue ?? ''; // Assign the selected permission to the _perController
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Permission',
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
                      items: permissionList.map((permission) {
                        return DropdownMenuItem<String>(
                          value: permission,
                          child: Text(permission),
                        );
                      }).toList(),
                    ),
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
