import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/reservation_model.dart';
import '../repository/reservation_repo.dart';

class ReservationPage extends StatefulWidget {
  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  DateTime fromDate = DateTime.now(); // Initialize with default value
  DateTime toDate = DateTime.now(); // Initialize with default value
  TimeOfDay selectedTime = TimeOfDay.now(); // Initialize with default value
  String? numberOfGuests;

  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );





    if (pickedDate != null) {
      setState(() {
        if (isFromDate) {
          fromDate = pickedDate;
        } else {
          toDate = pickedDate;
        }
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  Future<void> submitReservation() async {
    final url = 'https://652b9ff8d0d1df5273ee8a8e.mockapi.io/hotels2/reservation';

    final reservationData = {
      'fromDate': fromDate.toString(),
      'toDate': toDate.toString(),
      'selectedTime': selectedTime.format(context),
      'numberOfGuests': numberOfGuests,
    };

    final response = await http.post(Uri.parse(url), body: reservationData);

    if (response.statusCode == 201) {
      // Reservation submitted successfully
      print('Reservation submitted successfully');
    } else {
      // Error occurred while submitting reservation
      print('Error submitting reservation. Status code: ${response.statusCode}');
    }
  }

  @override


  bool loading=false;
  bool iserror=false;
  bool issuccess=false;
  String error="";


  var fromdateCtr=TextEditingController();
  var todateCtr=TextEditingController();
  var timeCtr=TextEditingController();
  var useridCtr=TextEditingController();
  var hotelidCtr=TextEditingController();
  var numguestsCtr=TextEditingController();
  var formKey=GlobalKey<FormState>();
  Widget build(BuildContext context) {

    return Scaffold(
      body:
     Form(key: formKey,child:
      SingleChildScrollView(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date Range',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Select a date range for your reservation:',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 40.0),
            InkWell(
              onTap: () {
                _selectDate(context, true);
              },
              child: TextFormField(
                controller: fromdateCtr,
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.onUserInteraction,

                enabled: false,
                decoration: InputDecoration(
                  labelText: fromDate != null
                      ? 'From: ${fromDate.day}/${fromDate.month}/${fromDate.year}'
                      : 'Select From Date',
                  prefixIcon: Icon(Icons.calendar_today),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
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
            ),
            SizedBox(height: 20.0),
            InkWell(
              onTap: () {
                _selectDate(context, false);
              },
              child: TextFormField(

                controller: todateCtr,
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.onUserInteraction,

                enabled: false,
                decoration: InputDecoration(
                  labelText: toDate != null
                      ? 'To: ${toDate.day}/${toDate.month}/${toDate.year}'
                      : 'Select To Date',
                  prefixIcon: Icon(Icons.calendar_today),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
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
            ),
            SizedBox(height: 40.0),
            Text(
              'Time',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Select a time for your reservation:',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 40.0),
            InkWell(
              onTap: () {
                _selectTime(context);
              },
              child: TextFormField(

                controller: timeCtr,
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.onUserInteraction,

                enabled: false,
                decoration: InputDecoration(
                  labelText: selectedTime != null
                      ? '${selectedTime.hour}:${selectedTime.minute}'
                      : 'Select Time',
                  prefixIcon: Icon(Icons.access_time),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
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
            ),
            SizedBox(height: 40.0),
            Text(
              'Number of Guests',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Enter the number of guests:',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: numguestsCtr,
              keyboardType: TextInputType.number,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                labelText: 'Number of Guests',
                prefixIcon: Icon(Icons.person),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  numberOfGuests = value;
                });
              },

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



            SizedBox(height: 40.0),



          if (loading) CircularProgressIndicator() else TextButton(onPressed: ()async{
      if(formKey.currentState!.validate()){
        try{
          setState(() {
            loading=true;
            issuccess=false;
            iserror=false;

          });
          var date={
            "fromdate":int.parse(fromdateCtr.text),
            "todate":int.parse(todateCtr.text),
            "time":int.parse(timeCtr.text),
            "userid":"88",
            "hotelid":"77",
            "numguests":int.parse(numguestsCtr.text),



          };
          var addRes=await ReservationRepository().addd(ReservationModel.fromJson(date));
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


            // ElevatedButton(
            //   onPressed: () {
            //     submitReservation();
            //   },




              child: Text('Submit Reservation'),
            ),
          ],
        ),
      ),
     ),
    );
  }
}
