import 'package:flutter/material.dart';
import '../../repository/authontication.dart';
import '../../models/reservation_model.dart';
import '../../repository/reservation_repo.dart';
import '../login/login_page.dart';
import 'my_reservation.dart';

class ReservationPage extends StatefulWidget {
  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  TextEditingController fromdateCtr = TextEditingController();
  TextEditingController todateCtr = TextEditingController();// Initialize with default value
  int? numberOfGuests;
  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (pickedDate != null) {
      final formattedDate =
          '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
      setState(() {
        if (isFromDate) {
          fromdateCtr.text = formattedDate;
        } else {
          todateCtr.text = formattedDate;
        }
      });
    }
  }


  @override


  bool loading=false;
  bool iserror=false;
  bool issuccess=false;
  String error="";



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
                  labelText: fromdateCtr.text.isNotEmpty
                      ? 'From: ${fromdateCtr.text}'
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
                  labelText: todateCtr.text.isNotEmpty
                      ? 'To: ${todateCtr.text}'
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
                  numberOfGuests = value as int?;
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
            "fromdate":fromdateCtr.text,
            "todate":todateCtr.text,
            "userid": AuthenticationProvider.iduser,
            "hotelid": AuthenticationProvider.idhotel,
            "numguests":int.parse(numguestsCtr.text),

          };
          print("###################################${AuthenticationProvider.iduser}");

          var addRes=await ReservationRepository().addd(ReservationModel.fromJson(date));

          print("###################################${ AuthenticationProvider.idhotel}");

          if(addRes==true){

            setState(() {
              loading=false;
              issuccess=true;
              iserror=false;
              error="";


            });
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => myres()),
            );
          }
          else{
            setState(() {
              loading=false;
              issuccess=false;
              iserror=true;
              error="Operation failed!!";
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => myres()),
              );
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
