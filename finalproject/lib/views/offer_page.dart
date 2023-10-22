import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'reservation/add_reservation.dart';

class OfferPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(

              height: 240.0,
              child: VerticalSliderDemo(),
            ),
            SizedBox(height: 1.0),
            OfferCard(
              title: 'Limited Time Offer 1',
              image: 'assets/hotel_5.png',
              description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              originalPrice: '\$199.99',
              discountedPrice: '\$99.99',
            ),
            SizedBox(height: 16.0),
            OfferCard(
              title: 'Limited Time Offer 2',
              image: 'assets/hotel_3.png',
              description: 'Praesent eget varius justo. Phasellus non velit vel nunc dignissim convallis.',
              originalPrice: '\$99.99',
              discountedPrice: '\$49.99',
            ),
            SizedBox(height: 16.0),
            OfferCard(
              title: 'Limited Time Offer 3',
              image: 'assets/hotel_2.png',
              description: 'Nulla facilisi. Sed felis enim, scelerisque et varius eget, interdum nec lectus.',
              originalPrice: '\$199.99',
              discountedPrice: '\$149.99',
            ),
          ],
        ),
      ),
    );
  }
}

class VerticalSliderDemo extends StatefulWidget {
  @override
  _VerticalSliderDemoState createState() => _VerticalSliderDemoState();
}

class _VerticalSliderDemoState extends State<VerticalSliderDemo> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(

          options: CarouselOptions(
            height: 203.0, // Adjust the height as needed
            aspectRatio: 16 / 9, // Adjust the aspect ratio as needed
            autoPlay: true,
            // Set to false if you don't want auto play
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: [
            'assets/a1.png',
            'assets/a2.png',
            'assets/dd.jpg',
          ].map((image) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 2.0),
                  decoration: BoxDecoration(
                    color: Colors.transparent, // Adjust the background color as needed
                    border: Border.all(
                      color: Colors.white,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(8.0),
                          bottom: Radius.circular(8.0),
                        ),
                        child: Image.asset(
                          image,
                          width: double.infinity,
                          height: 200.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // ...
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 3; i++)
              Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == i ? Colors.black : Colors.grey,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
class OfferCard extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  final String originalPrice;
  final String discountedPrice;

  OfferCard({
    required this.title,
    required this.image,
    required this.description,
    required this.originalPrice,
    required this.discountedPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
            child: Image.asset(
              image,
              width: double.infinity,
              height: 200.0,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          originalPrice,
                          style: TextStyle(
                            fontSize: 14.0,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        Text(
                          discountedPrice,
                          style: TextStyle(
                            fontSize: 19.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Text(
                  description,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReservationPage()),
                    );
                    // Add your action here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    minimumSize: Size(400, 40),
                    // Add your button style here
                  ),
                  child: Text('Book It Now'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}