import 'dart:ffi';

import 'package:flutter/material.dart';

import 'dart:io';
import 'dart:typed_data';

// import 'package:image_picker/image_picker.dart';
import 'package:project4/repository/user_repo.dart';

import '../../../CustomPages/appbar.dart';
import '../../../models/user_model.dart';


// selectImageFromGallery() async {
//   XFile? file = await ImagePicker()
//       .pickImage(source: ImageSource.gallery, imageQuality: 10);
//   if (file != null) {
//     return file.path;
//   } else {
//     return '';
//   }
// }


class userAdd extends StatefulWidget {
  const userAdd({Key? key}) : super(key: key);

  @override
  State<userAdd> createState() => _userAdd();
}

class _userAdd extends State<userAdd> {
  @override
  String? selectedPermission;
  String? selectedGender;

  final permissionList = ['admin', 'user'];
  final genderList = ['male', 'female', 'others'];

  String selectedImagePath = 'jhgggj';

  bool loading=false;
  bool iserror=false;
  bool issuccess=false;
  String error="";
  var nameCtr=TextEditingController();

  var phoneCtr=TextEditingController();
  var emailCtr=TextEditingController();
  var passwordCtr=TextEditingController();
  var genderCtr=TextEditingController();
  var perCtr=TextEditingController();
  var usernameCtr=TextEditingController();



  var formKey=GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  SearchAppBar(),
      body: 
      Form(key: formKey,child:
      SingleChildScrollView(
        child: Column(
          children: [
            // selectedImagePath == ''
            //     ? Container(child: Icon(Icons.image),width: 50,height: 50,)
            //
            //     : Image.file(File(selectedImagePath), height: 200, width: 200, fit: BoxFit.fill,),
            // Text(
            //   'Select Image',
            //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            // ),
            // SizedBox(
            //   height: 20.0,
            // ),
            // ElevatedButton(
            //     style: ButtonStyle(
            //         backgroundColor: MaterialStateProperty.all(Colors.green),
            //         padding:
            //         MaterialStateProperty.all(const EdgeInsets.all(20)),
            //         textStyle: MaterialStateProperty.all(
            //             const TextStyle(fontSize: 14, color: Colors.white))),
            //     onPressed: () async {
            //       selectedImagePath = await selectImageFromGallery();
            //       print('Image_Path:-');
            //       print(selectedImagePath);
            //       if (selectedImagePath != '') {
            //
            //
            //         setState(() {
            //           //selectedImagePath=selectedImagePath
            //
            //
            //         });
            //       } else {
            //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //           content: Text("No Image Selected !"),
            //         ));
            //       }
            //       setState(() {});
            //     },
            //     child: const Text('Select')),
            const SizedBox(height: 10),



            SizedBox(height: 100,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(

                controller: nameCtr,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Name",
                  labelText: "Name",
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  counterText: "20",
                  border:
                  OutlineInputBorder(borderSide:BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.circular(20)),
                  errorBorder:  OutlineInputBorder(borderSide:BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(20)),



                ),


                validator: (val){
                  if(val == ""){
                    return "value is null";}
                  if(val != null){
                    if(val.length <3){
                      return "name must be more than 3 chars";
                    }

                  }
                }
                ,

              ),
            ),//name
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(

                controller: usernameCtr,
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


                validator: (val){
                  if(val == ""){
                    return "value is null";}
                  if(val != null){
                    if(val.length <3){
                      return "User Name must be more than 3 chars";
                    }

                  }
                }
                ,

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(

                controller: emailCtr,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: "email",
                  labelText: "email",
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  counterText: "20",
                  border:
                  OutlineInputBorder(borderSide:BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.circular(20)),
                  errorBorder:  OutlineInputBorder(borderSide:BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(20)),



                ),


                validator: (val){
                  if(val == ""){
                    return "value is null";}
                  if(val != null){
                    if(val.length <3){
                      return "email must be more than 3 chars";
                    }

                  }
                }
                ,

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(

                controller: phoneCtr,
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: "phone",
                  labelText: "phone",
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  counterText: "20",
                  border:
                  OutlineInputBorder(borderSide:BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.circular(20)),
                  errorBorder:  OutlineInputBorder(borderSide:BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(20)),



                ),


                validator: (val){
                  if(val == ""){
                    return "value is null";}
                  if(val != null){
                    if(val.length <3){
                      return "phone must be more than 3 chars";
                    }

                  }
                }
                ,

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(

                controller: passwordCtr,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: "password",
                  labelText: "password",
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  counterText: "20",
                  border:
                  OutlineInputBorder(borderSide:BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.circular(20)),
                  errorBorder:  OutlineInputBorder(borderSide:BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(20)),



                ),


                validator: (val){
                  if(val == ""){
                    return "value is null";}
                  if(val != null){
                    if(val.length <3){
                      return "password must be more than 3 chars";
                    }

                  }
                }
                ,

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: DropdownButtonFormField<String>(
                value: selectedGender,
                onChanged: (newValue) {
                  setState(() {
                    selectedGender = newValue;
                    genderCtr.text = newValue ?? '';
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: DropdownButtonFormField<String>(
                value: selectedPermission,
                onChanged: (newValue) {
                  setState(() {
                    selectedPermission = newValue;
                    perCtr.text = newValue ?? '';
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



           if (loading) CircularProgressIndicator() else TextButton(onPressed: ()async{
              if(formKey.currentState!.validate()){
                try{
                  setState(() {
                    loading=true;
                    issuccess=false;
                    iserror=false;

                  });
                var date={
                "fName":nameCtr.text,
                  "img":"https://th.bing.com/th/id/R.e2981720d54bd5c7869ed4918473dbf5?rik=3km1AVdxxXLKSA&riu=http%3a%2f%2fvbconversions.com%2fwp-content%2fuploads%2f2018%2f04%2fperson-icon-6.png&ehk=N8n%2bOsRYgQcalmQs9Vv9wEsqtw93GDpSp23eQJOwfTM%3d&risl=&pid=ImgRaw&r=0",
                "uName":nameCtr.text,
                "password":passwordCtr.text,
                "phone":int.parse(phoneCtr.text),
                "per":perCtr.text,
                "gender":genderCtr.text,
                "email":emailCtr.text,


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

              }


                , child: Text("send")),
            iserror?Text("error:${error}",style: TextStyle(color: Colors.red),):SizedBox(),
            issuccess?Text("Added successfully",style: TextStyle(color: Colors.green),):SizedBox()




          ],
        ),
      ),),
    );
  }
}


