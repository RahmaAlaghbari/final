// import 'package:flutter/material.dart';
//
// import '../models/user_model.dart';
// import '../repository/user_repo.dart';
//
// class SignUpPage extends StatefulWidget {
//   @override
//   _SignUpPageState createState() => _SignUpPageState();
// }
//
// class _SignUpPageState extends State<SignUpPage> {
//   String? selectedGender;
//
//   final genderList = ['male', 'female', 'others'];
//
//   String selectedImagePath = 'jhgggj';
//
//   bool loading=false;
//   bool iserror=false;
//   bool issuccess=false;
//   String error="";
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _imageController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _phoneController = TextEditingController();
//   TextEditingController _usernameController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   TextEditingController _genderController = TextEditingController();
//
//   @override  @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//             image: AssetImage('assets/register.png'), fit: BoxFit.cover),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//         ),
//         body: Form(
//           key: _formKey,
//           child: Stack(
//             children: [
//               Container(
//                 padding: EdgeInsets.only(left: 35, top: 30),
//                 child: Text(
//                   'Create\nAccount',
//                   style: TextStyle(color: Colors.white, fontSize: 33),
//                 ),
//               ),
//               SingleChildScrollView(
//                 child: Container(
//                   padding: EdgeInsets.only(
//                       top: MediaQuery.of(context).size.height * 0.28),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(left: 35, right: 35),
//                         child: Column(
//                           children: [
//                             TextFormField(
//                               controller: _nameController,
//                               autovalidateMode: AutovalidateMode.onUserInteraction,
//
//                               style: TextStyle(color: Colors.white),
//
//                               decoration: InputDecoration(
//                                   border:
//                                   OutlineInputBorder(borderSide:BorderSide(color: Colors.amber),
//                                       borderRadius: BorderRadius.circular(10)),
//                                   errorBorder:  OutlineInputBorder(borderSide:BorderSide(color: Colors.red),
//                                       borderRadius: BorderRadius.circular(10)),
//
//
//
//                                   enabledBorder: OutlineInputBorder(
//
//                                     borderRadius: BorderRadius.circular(10),
//
//                                     borderSide: BorderSide(
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                     borderSide: BorderSide(
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                   hintText: "Name",
//                                   hintStyle: TextStyle(color: Colors.white),
//                                  ),
//
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter your name';
//                                 }
//                                 return null;
//                               },
//
//
//                             ),
//                             SizedBox(
//                               height: 30,
//                             ),//name
//                             TextFormField(
//                               controller: _imageController,
//                               style: TextStyle(color: Colors.white),
//                               decoration: InputDecoration(
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                     borderSide: BorderSide(
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                     borderSide: BorderSide(
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                   hintText: "Image",
//                                   hintStyle: TextStyle(color: Colors.white),
//                                 border:
//                                 OutlineInputBorder(borderSide:BorderSide(color: Colors.amber),
//                                     borderRadius: BorderRadius.circular(20)),
//                                 errorBorder:  OutlineInputBorder(borderSide:BorderSide(color: Colors.red),
//                                     borderRadius: BorderRadius.circular(20)),
//
//                               ),
//
//
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter the image URL';
//                                 }
//                                 return null;
//                               },
//                             ),
//                             SizedBox(
//                               height: 30,
//                             ),//img
//                             TextFormField(
//                               controller: _emailController,
//                               style: TextStyle(color: Colors.white),
//                               decoration: InputDecoration(
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                   borderSide: BorderSide(
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                   borderSide: BorderSide(
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 hintText: "email",
//                                 hintStyle: TextStyle(color: Colors.white),
//                                 border:
//                                 OutlineInputBorder(borderSide:BorderSide(color: Colors.amber),
//                                     borderRadius: BorderRadius.circular(20)),
//                                 errorBorder:  OutlineInputBorder(borderSide:BorderSide(color: Colors.red),
//                                     borderRadius: BorderRadius.circular(20)),
//
//                               ),
//
//
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter the email';
//                                 }
//                                 return null;
//                               },
//                             ),
//                             SizedBox(
//                               height: 30,
//                             ),//email
//                             TextFormField(
//                               controller: _usernameController,
//                               style: TextStyle(color: Colors.white),
//                               decoration: InputDecoration(
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                   borderSide: BorderSide(
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                   borderSide: BorderSide(
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 hintText: "User Name",
//                                 hintStyle: TextStyle(color: Colors.white),
//                                 border:
//                                 OutlineInputBorder(borderSide:BorderSide(color: Colors.amber),
//                                     borderRadius: BorderRadius.circular(20)),
//                                 errorBorder:  OutlineInputBorder(borderSide:BorderSide(color: Colors.red),
//                                     borderRadius: BorderRadius.circular(20)),
//
//                               ),
//
//
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter the User Name';
//                                 }
//                                 return null;
//                               },
//                             ),
//                             SizedBox(
//                               height: 30,
//                             ),//user
//
//                             TextFormField(
//                               controller: _passwordController,
//
//                               style: TextStyle(color: Colors.white),
//                               obscureText: true,
//                               decoration: InputDecoration(
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                     borderSide: BorderSide(
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                     borderSide: BorderSide(
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                   hintText: "Password",
//                                   hintStyle: TextStyle(color: Colors.white),
//                                 border:
//                                 OutlineInputBorder(borderSide:BorderSide(color: Colors.amber),
//                                     borderRadius: BorderRadius.circular(20)),
//                                 errorBorder:  OutlineInputBorder(borderSide:BorderSide(color: Colors.red),
//                                     borderRadius: BorderRadius.circular(20)),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 40,
//                             ),
//
//                             SizedBox(height: 16.0),
//                             Padding(
//                               padding: const EdgeInsets.all(20.0),
//                               child: DropdownButtonFormField<String>(
//                                 value: selectedGender,
//                                 onChanged: (newValue) {
//                                   setState(() {
//                                     selectedGender = newValue;
//                                     _genderController.text = newValue ?? '';
//                                   });
//                                 },
//                                 decoration: InputDecoration(
//                                   labelText: 'Gender',
//                                   labelStyle: TextStyle(fontWeight: FontWeight.bold),
//                                   border: OutlineInputBorder(
//                                     borderSide: BorderSide(color: Colors.amber),
//                                     borderRadius: BorderRadius.circular(20),
//                                   ),
//                                   errorBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(color: Colors.red),
//                                     borderRadius: BorderRadius.circular(20),
//                                   ),
//                                 ),
//                                 items: genderList.map((gender) {
//                                   return DropdownMenuItem<String>(
//                                     value: gender,
//                                     child: Text(gender),
//                                   );
//                                 }).toList(),
//                               ),
//                             ),
//                             SizedBox(height: 24.0),
//
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   'Sign Up',
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 27,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                                 if (loading) CircularProgressIndicator() else CircleAvatar(
//                                   radius: 30,
//                                   backgroundColor: Color(0xff4c505b),
//                                   child: IconButton(
//                                       color: Colors.white,
//                                       onPressed:  ()async{
//                                         if (_formKey.currentState!.validate()) {
//                                           try{
//                                             setState(() {
//                                               loading=true;
//                                               issuccess=false;
//                                               iserror=false;
//
//                                             });
//                                             var date={
//                                               "fName":_nameController.text,
//                                               "img":"https://th.bing.com/th/id/R.e2981720d54bd5c7869ed4918473dbf5?rik=3km1AVdxxXLKSA&riu=http%3a%2f%2fvbconversions.com%2fwp-content%2fuploads%2f2018%2f04%2fperson-icon-6.png&ehk=N8n%2bOsRYgQcalmQs9Vv9wEsqtw93GDpSp23eQJOwfTM%3d&risl=&pid=ImgRaw&r=0",
//                                               "uName":_usernameController.text,
//                                               "password":_passwordController.text,
//                                               "phone":int.parse(_phoneController.text),
//                                               "per":"user",
//                                               "gender":_genderController.text,
//                                               "email":_emailController.text,
//
//
//                                             };
//                                             var addRes=await UserRepository().addd(UserModel.fromJson(date));
//                                             if(addRes!=true){
//                                               setState(() {
//                                                 loading=false;
//                                                 issuccess=true;
//                                                 iserror=false;
//                                                 error="";
//
//                                               });
//                                               Navigator.of(context).pop(true);
//
//                                             }
//                                             else{
//                                               setState(() {
//                                                 loading=false;
//                                                 issuccess=false;
//                                                 iserror=true;
//                                                 error="Operation failed!!";
//
//                                               });
//                                             }
//                                           }
//
//                                           catch(e){
//                                             setState(() {
//                                               loading=false;
//                                               issuccess=false;
//                                               iserror=true;
//                                               error="Exception: ${e}";
//
//                                             });
//                                           }
//                                         }
//                                       },
//                                       icon: Icon(
//                                         Icons.arrow_forward,
//                                       )),
//                                 )
//                               ],
//                             ),
//                             SizedBox(
//                               height: 40,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 TextButton(
//                                   onPressed: () {
//                                     Navigator.of(context).pop(true);
//
//                                   },
//                                   child: Text(
//                                     'Sign In',
//                                     textAlign: TextAlign.left,
//                                     style: TextStyle(
//                                         decoration: TextDecoration.underline,
//                                         color: Colors.white,
//                                         fontSize: 18),
//                                   ),
//                                   style: ButtonStyle(),
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//
//               iserror?Text("error:${error}",style: TextStyle(color: Colors.red),):SizedBox(),
//               issuccess?Text("Added successfully",style: TextStyle(color: Colors.green),):SizedBox()
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
