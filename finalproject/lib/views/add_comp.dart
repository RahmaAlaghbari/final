import 'dart:ffi';

import 'package:flutter/material.dart';

import 'dart:io';
import 'dart:typed_data';


import '../../../CustomPages/appbar.dart';
import '../models/comp_model.dart';
import '../repository/comp_repo.dart';




class CompAdd extends StatefulWidget {
  const CompAdd({Key? key}) : super(key: key);

  @override
  State<CompAdd> createState() => _CompAdd();
}

class _CompAdd extends State<CompAdd> {
  @override



  bool loading=false;
  bool iserror=false;
  bool issuccess=false;
  String error="";

  var emailCtr=TextEditingController();
  var descriptionCtr=TextEditingController();



  var formKey=GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:   customAppBar(context,'New Complaints'),
      body:
      Form(key: formKey,child:
      SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 10),



            SizedBox(height: 20,),

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

                controller: descriptionCtr,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Your Complaint",
                  labelText: "Your Complaint",
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  counterText: "50",
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




            if (loading) CircularProgressIndicator() else TextButton(onPressed: ()async{
              if(formKey.currentState!.validate()){
                try{
                  setState(() {
                    loading=true;
                    issuccess=false;
                    iserror=false;

                  });
                  var date={
                    "description":descriptionCtr.text,
                    "email":emailCtr.text,


                  };
                  var addRes=await CompRepository().addd(CompModel.fromJson(date));
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


