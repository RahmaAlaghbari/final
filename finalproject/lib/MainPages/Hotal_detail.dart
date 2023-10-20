

import 'package:flutter/material.dart';
import 'reservation_page.dart';

import 'Hotels_page.dart';

class HotelDetailsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Row(
          children: [
            Icon(Icons.hotel, color: Colors.white),
            SizedBox(width: 8),
            Text(
              'Hotel Details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              // child: Image.asset(
              //   hotel.image,
              //   width: double.infinity,
              //   height: 200.0,
              //   fit: BoxFit.cover,
              // ),
            ),
            SizedBox(height: 16.0),
            // Row(
            //   children: [
            //     Icon(Icons.hotel, color: Colors.blueGrey),
            //     SizedBox(width: 8.0),
            //     Text(
            //       hotel.name,
            //       style: TextStyle(
            //         fontSize: 24.0,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.blueGrey,
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(height: 8.0),
            // Text(
            //   hotel.description,
            //   style: TextStyle(
            //     fontSize: 16.0,
            //     color: Colors.grey[600],
            //   ),
            // ),
            SizedBox(height: 8.0),
            Divider(
              thickness: 1.0,
              color: Colors.grey[400],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Icon(Icons.attach_money, color: Colors.black),
                SizedBox(width: 8.0),
                Text(
                  'Price:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            // Text(
            //   '        ${hotel.price}',
            //   style: TextStyle(
            //     fontSize: 18.0,
            //
            //     color: Colors.black,
            //   ),
            // ),
            SizedBox(height: 8.0),
            Divider(
              thickness: 1.0,
              color: Colors.grey[400],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Icon(Icons.description, color: Colors.black),
                SizedBox(width: 8.0),
                Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              'Welcome to our luxurious hotel! Enjoy a comfortable and unforgettable stay in our well-appointed rooms. Experience top-notch amenities and services, including a relaxing spa, state-of-the-art gym, and refreshing pool. Indulge in exquisite dining options at our on-site restaurant. Our friendly staff is dedicated to providing exceptional hospitality and ensuring your every need is met. Discover the perfect blend of elegance and convenience at our hotel.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8.0),
            Divider(
              thickness: 1.0,
              color: Colors.grey[400],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.black),
                SizedBox(width: 8.0),
                Text(
                  'Location:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              'City, Country',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReservationPage()),
                );
                // Add your booking logic here
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                minimumSize: Size(400, 40),
              ),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'Book Now',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,

                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}