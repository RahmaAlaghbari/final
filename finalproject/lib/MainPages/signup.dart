import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../repository/user_repo.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? selectedGender;

  final genderList = ['male', 'female', 'others'];

  String selectedImagePath = 'jhgggj';

  bool loading=false;
  bool iserror=false;
  bool issuccess=false;
  String error="";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _imageController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                autovalidateMode: AutovalidateMode.onUserInteraction,

                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: "Name",
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  counterText: "20",
                  border:
                  OutlineInputBorder(borderSide:BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.circular(20)),
                  errorBorder:  OutlineInputBorder(borderSide:BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(20)),



                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _imageController,
                decoration: InputDecoration(
                  labelText: 'Image',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  counterText: "20",
                  border:
                  OutlineInputBorder(borderSide:BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.circular(20)),
                  errorBorder:  OutlineInputBorder(borderSide:BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(20)),


                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the image URL';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  counterText: "20",
                  border:
                  OutlineInputBorder(borderSide:BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.circular(20)),
                  errorBorder:  OutlineInputBorder(borderSide:BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(20)),


                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  counterText: "20",
                  border:
                  OutlineInputBorder(borderSide:BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.circular(20)),
                  errorBorder:  OutlineInputBorder(borderSide:BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(20)),


                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  counterText: "20",
                  border:
                  OutlineInputBorder(borderSide:BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.circular(20)),
                  errorBorder:  OutlineInputBorder(borderSide:BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(20)),


                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  counterText: "20",
                  border:
                  OutlineInputBorder(borderSide:BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.circular(20)),
                  errorBorder:  OutlineInputBorder(borderSide:BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(20)),


                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
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
                    labelText: 'Gender',
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
              SizedBox(height: 24.0),
              if (loading) CircularProgressIndicator() else ElevatedButton(
                onPressed:  ()async{
                  if (_formKey.currentState!.validate()) {
                    try{
                      setState(() {
                        loading=true;
                        issuccess=false;
                        iserror=false;

                      });
                      var date={
                        "fName":_nameController.text,
                        "img":"https://th.bing.com/th/id/R.e2981720d54bd5c7869ed4918473dbf5?rik=3km1AVdxxXLKSA&riu=http%3a%2f%2fvbconversions.com%2fwp-content%2fuploads%2f2018%2f04%2fperson-icon-6.png&ehk=N8n%2bOsRYgQcalmQs9Vv9wEsqtw93GDpSp23eQJOwfTM%3d&risl=&pid=ImgRaw&r=0",
                        "uName":_usernameController.text,
                        "password":_passwordController.text,
                        "phone":int.parse(_phoneController.text),
                        "per":"user",
                        "gender":_genderController.text,
                        "email":_emailController.text,


                      };
                      var addRes=await UserRepository().addd(UserModel.fromJson(date));
                      if(addRes!=true){
                        setState(() {
                          loading=false;
                          issuccess=true;
                          iserror=false;
                          error="";

                        });
                        Navigator.of(context).pop(true);
                      }
                      else{
                        setState(() {
                          loading=false;
                          issuccess=false;
                          iserror=true;
                          error="Operation failed!!";

                        });
                      }
                    }

                    catch(e){
                      setState(() {
                        loading=false;
                        issuccess=false;
                        iserror=true;
                        error="Exception: ${e}";

                      });
                    }
                  }
                },
                child: Text('Sign Up'),

              ),

              iserror?Text("error:${error}",style: TextStyle(color: Colors.red),):SizedBox(),
              issuccess?Text("Added successfully",style: TextStyle(color: Colors.green),):SizedBox()


            ],
          ),
        ),
      ),
    );
  }
}