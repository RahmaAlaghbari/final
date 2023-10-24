import 'package:flutter/material.dart';

import '../../models/user_model.dart';
import '../../repository/user_repo.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();

  //_SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? selectedGender;

  final genderList = ['male', 'female', 'others'];

  String selectedImagePath = 'jhgggj';

  bool loading=false;
  bool iserror=false;
  bool issuccess=false;
  String error="";
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var nameCtr=TextEditingController();

  var phoneCtr=TextEditingController();
  var emailCtr=TextEditingController();
  var passwordCtr=TextEditingController();
  var genderCtr=TextEditingController();
  var perCtr=TextEditingController();
  var usernameCtr=TextEditingController();


  var formKey=GlobalKey<FormState>();



  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/register.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Form(
          key: formKey,child:
        SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 35, top: 30),
                  child: Text(
                    'Create\nAccount',
                    style: TextStyle(color: Colors.white, fontSize: 33),
                  ),
                ),
                Container(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 35, right: 35),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: nameCtr,
                                autovalidateMode: AutovalidateMode.onUserInteraction,

                                style: TextStyle(color: Colors.black54),

                                decoration: InputDecoration(
                                  border:
                                  OutlineInputBorder(borderSide:BorderSide(color: Colors.amber),
                                      borderRadius: BorderRadius.circular(10)),
                                  errorBorder:  OutlineInputBorder(borderSide:BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.circular(10)),



                                  enabledBorder: OutlineInputBorder(

                                    borderRadius: BorderRadius.circular(10),

                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Name",
                                  fillColor: Colors.grey.shade100,
                                  filled: true,

                                ),

                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  return null;
                                },


                              ),
                              SizedBox(
                                height: 30,
                              ),//name
                              TextFormField(
                                controller: usernameCtr,
                                style: TextStyle(color: Colors.black54),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "User Name",
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
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
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),//img
                              TextFormField(
                                controller: emailCtr,
                                style: TextStyle(color: Colors.black54),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "email",
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  border:
                                  OutlineInputBorder(borderSide:BorderSide(color: Colors.amber),
                                      borderRadius: BorderRadius.circular(20)),
                                  errorBorder:  OutlineInputBorder(borderSide:BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.circular(20)),

                                ),


                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the email';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),//email
                              TextFormField(
                                controller: phoneCtr,
                                keyboardType: TextInputType.number,
                                style: TextStyle(color: Colors.black54),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "phone",
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  border:
                                  OutlineInputBorder(borderSide:BorderSide(color: Colors.amber),
                                      borderRadius: BorderRadius.circular(20)),
                                  errorBorder:  OutlineInputBorder(borderSide:BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.circular(20)),

                                ),


                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the Phone Number';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),//user

                              TextFormField(
                                controller: passwordCtr,

                                style: TextStyle(color: Colors.black54),
                                obscureText: true,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Password",
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  border:
                                  OutlineInputBorder(borderSide:BorderSide(color: Colors.amber),
                                      borderRadius: BorderRadius.circular(20)),
                                  errorBorder:  OutlineInputBorder(borderSide:BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),

                              SizedBox(height: 16.0),
                              Container(//////////////////////////////////////////////////////////////////////////////////////////////

                                  child: DropdownButtonFormField<String>(
                                    value: selectedGender,
                                    onChanged: (newValue) {
                                      setState(() {
                                        selectedGender = newValue;
                                        genderCtr.text = newValue ?? '';
                                      });
                                    },
                                    decoration: InputDecoration(

                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                        ),
                                      ),
                                      hintText: "Gender",
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      border:
                                      OutlineInputBorder(borderSide:BorderSide(color: Colors.amber),
                                          borderRadius: BorderRadius.circular(20)),
                                      errorBorder:  OutlineInputBorder(borderSide:BorderSide(color: Colors.red),
                                          borderRadius: BorderRadius.circular(20)),
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

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Sign Up',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 27,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  if (loading) CircularProgressIndicator() else CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Color(0xFFA76F6F),
                                    child: IconButton(
                                        color: Colors.white,
                                        onPressed:  ()async{
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
                                                "per":"user",
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
                                      Navigator.of(context).pop(true);

                                    },
                                    child: Text(
                                      'Sign In',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.white,
                                          fontSize: 18),
                                    ),
                                    style: ButtonStyle(),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                iserror?Text("error:${error}",style: TextStyle(color: Colors.red),):SizedBox(),
                issuccess?Text("Added successfully",style: TextStyle(color: Colors.green),):SizedBox()

              ],
            ),
          ),
        ),
      ),
    );
  }
}
