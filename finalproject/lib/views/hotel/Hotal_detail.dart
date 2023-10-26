import 'package:flutter/material.dart';
import '../../CustomPages/appbar.dart';
import '../../CustomPages/configuration.dart';
import '../../repository/authontication.dart';
import '../reservation/add_reservation.dart';

class HotelDetailsPage extends StatefulWidget {
  @override
  State<HotelDetailsPage> createState() => _HotelDetailsPageState();
}
class _HotelDetailsPageState extends State<HotelDetailsPage> {
  Future<void> refreshPage() async {
    // Simulate an asynchronous operation to refresh the page
    await Future.delayed(Duration(seconds: 6));

    setState(() {
      // Update the necessary data or perform any other actions
    });
  }

  @override
  Widget build(BuildContext context) {
    print("@@@@@@@@@@@@@@@@@@@@@@@@@#${AuthenticationProvider.pricehotel}");
    return RefreshIndicator(
      onRefresh: refreshPage,
      child: Scaffold(
        appBar: customAppBar(context, 'Details'),
        body: Stack(

        children: [
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 160),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Hero(
                        tag: 1,
                        child: Transform.scale(
                         scaleX: 3.2,
                          scaleY: 5,// Increase the scale factor as desired
                          child: Image.network('${AuthenticationProvider.avatarhotel}'),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),



          Align(
            alignment: Alignment.center,
            child: Container(
              height: 70,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: shadowList,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  '${AuthenticationProvider.namehotel}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: 120,
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 70,
                    decoration: BoxDecoration(
                        color: primaryGreen,

                        borderRadius: BorderRadius.circular(20)),
                    child: Icon(Icons.favorite_border,color: Colors.white,),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(color: primaryGreen,borderRadius: BorderRadius.circular(20)),
                      child:
                      Center(
                        child: GestureDetector(
                          onTap: () {


                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReservationPage(),
                              ),
                            );
                            // Handle the onTap action here
                            // For example, navigate to a new page or perform a specific action
                          },
                          child: Text(
                            'Adoption',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
              ,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40), )
              ),
            ),
          )



        ],
      ),
    ),
    );
  }
}
