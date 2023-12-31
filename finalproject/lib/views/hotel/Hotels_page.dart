import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project4/repository/authontication.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../CustomPages/appbar.dart';
import '../../CustomPages/configuration.dart';
import '../../models/fav_model.dart';
import '../../models/hotel_model.dart';
import '../../repository/fav_repo.dart';
import '../../repository/hotel_repo.dart';
import '../reservation/add_reservation.dart';

class HotelColumn extends StatefulWidget {
  @override
  State<HotelColumn> createState() => _HotelColumnState();
}

class _HotelColumnState extends State<HotelColumn> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {});
      },
      child: SingleChildScrollView(
        child: Column(
          children: [HotelCardh()],
        ),
      ),
    );
  }
}

class HotelCardh extends StatefulWidget {

  const HotelCardh({super.key});


  @override
  State<HotelCardh> createState() => _HotelCardState();

}

class _HotelCardState extends State<HotelCardh> {
  int _currentIndex = 0;

  FavRepository _favoriteRepository = FavRepository();
  Set<int> _favoriteItems = Set<int>(); // Keep track of favorite items
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;


  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)..rotateY(isDrawerOpen? -0.5:0),
      duration: Duration(milliseconds: 250),

      decoration: BoxDecoration(
          color: Colors.grey[200],

          borderRadius: BorderRadius.circular(isDrawerOpen?40:0.0)

      ),
      child: SingleChildScrollView(
          child: Column(
            children: [
            SizedBox(
            height: 50,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isDrawerOpen?IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: (){
                    setState(() {
                      xOffset=0;
                      yOffset=0;
                      scaleFactor=1;
                      isDrawerOpen=false;

                    });
                  },

                ): IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      setState(() {
                        xOffset = 230;
                        yOffset = 150;
                        scaleFactor = 0.6;
                        isDrawerOpen=true;
                      });
                    }),
                Column(
                  children: [
                    Text('Location'),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: primaryGreen,
                        ),
                        Text('Ukraine'),
                      ],
                    ),
                  ],
                ),
                CircleAvatar()
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            margin: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.search),
                Text('Search pet to adopt'),
                Icon(Icons.settings)

              ],
            ),
          ),
              CarouselSlider(

                options: CarouselOptions(
                  height: 203.0, // Adjust the height as needed
                  aspectRatio: 16 / 9, // Adjust the aspect ratio as needed
                  autoPlay: true,
                  // Set to false if you don't want auto play
                  onPageChanged: (index, reason) {

                      _currentIndex = index;
                  },
                ),
                items: [
                  'assets/hotel_2.png',
                  'assets/hotel_3.png',
                  'assets/hotel_4.png',
                  'assets/hotel_5.png',
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
              SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Handle onTap for Title 1
                    },
                    child: InkWell(
                      borderRadius: BorderRadius.circular(40),
                      onTap: () {
                        // Handle onTap for Title 1
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.green[300],
                            child: Icon(Icons.image, size: 30, color: Colors.white),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'All',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 7.0),
                  GestureDetector(
                    onTap: () {




                      Container(

                        child: FutureBuilder<List<HotelModel>>(


                          future: HotelRepository().getAll(),


                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.connectionState == ConnectionState.done) {
                              if (snapshot.hasError)
                                return Center(child: Text("Error ${snapshot.error.toString()}"));
                              else if (snapshot.hasData) {
                                var list = snapshot.data ?? [];

                                return ListView.separated(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {

                                    return Container(
                                      child: Card(
                                        elevation: 4.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12.0),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            HotelRepository().getById(list[index].id.toString());

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => ReservationPage(),
                                              ),
                                            );
                                          },
                                          child: Stack(
                                            alignment: Alignment.topRight, // Add alignment
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                padding: EdgeInsets.all(16.0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius: BorderRadius.circular(12.0),
                                                      child: list[index].avatar == ''
                                                          ? Container(
                                                        child: Icon(Icons.image),
                                                        width: 50,
                                                        height: 50,
                                                      )
                                                          : Image.network(
                                                        list[index].avatar!,
                                                        width: double.infinity,
                                                        height: 150.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    SizedBox(height: 8.0),
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          "${list[index].name}",
                                                          style: TextStyle(
                                                            fontSize: 20.0,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          '${list[index].price}',
                                                          style: TextStyle(
                                                            fontSize: 18.0,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 8.0),
                                                    Text(
                                                      '${list[index].description}',
                                                      style: TextStyle(
                                                        fontSize: 16.0,
                                                        color: Colors.grey[600],
                                                      ),
                                                    ),
                                                    SizedBox(height: 8.0),
                                                    RatingBar.builder(
                                                      // initialRating: list[index].rating,
                                                      minRating: 1,
                                                      direction: Axis.horizontal,
                                                      allowHalfRating: true,
                                                      itemCount: 5,
                                                      itemSize: 24,
                                                      itemBuilder: (context, _) => Icon(
                                                        Icons.star,
                                                        color: Colors.amber,
                                                      ),
                                                      onRatingUpdate: (rating) {
                                                        // Handle rating update
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              FutureBuilder<List<FavModel>>(
                                                future: _favoriteRepository.getAll(),
                                                builder: (context, snapshot) {
                                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                                    return CircularProgressIndicator();
                                                  } else if (snapshot.hasData) {
                                                    List<FavModel>? favoriteList = snapshot.data;
                                                    if (favoriteList != null) {
                                                      _favoriteItems = favoriteList
                                                          .map((fav) => fav.hotelid)
                                                          .toSet().cast<int>();
                                                      // Find the matching fav object for the current hotel
                                                      FavModel? fav;
                                                      for (var favorite in favoriteList) {
                                                        if (favorite.hotelid == list[index].id) {
                                                          fav = favorite;
                                                          break;
                                                        }
                                                      }
                                                      return IconButton(
                                                        onPressed: () {
                                                          if (_favoriteItems.contains(list[index].id)) {
                                                            if (fav != null) {
                                                              _favoriteRepository.deletee(fav.id!);
                                                            }
                                                          } else {
                                                            var data = {
                                                              'userid': AuthenticationProvider.iduser,
                                                              'hotelid': list[index].id,
                                                            };
                                                            _favoriteRepository.addd(FavModel.fromJson(data));
                                                          }
                                                        },
                                                        icon: Icon(
                                                          _favoriteItems.contains(list[index].id)
                                                              ? Icons.favorite
                                                              : Icons.favorite_border,
                                                          color: Colors.red,
                                                        ),
                                                      );
                                                    }
                                                  }
                                                  return IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.favorite_border,
                                                      color: Colors.red,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(height: 16.0);
                                  },
                                  itemCount: list.length,
                                );
                              } else {
                                return Center(child: Text("No data available"));
                              }
                            } else {
                              return Center(child: Text("Error loading data"));
                            }
                          },
                        ),
                      );




                      // Handle onTap for Title 2
                    },
                    child: InkWell(
                      borderRadius: BorderRadius.circular(40),
                      onTap: () {
                        // Handle onTap for Title 2
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.lightBlue[200],
                            child: Icon(Icons.image, size: 30, color: Colors.white),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Title 2',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 7.0),
                  GestureDetector(
                    onTap: () {
                      // Handle onTap for Title 3
                    },
                    child: InkWell(
                      borderRadius: BorderRadius.circular(40),
                      onTap: () {
                        // Handle onTap for Title 3
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.amber[200],
                            child: Icon(Icons.image, size: 30, color: Colors.white),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Title 3',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 7.0),
                  GestureDetector(
                    onTap: () {
                      // Handle onTap for Title 4
                    },
                    child: InkWell(
                      borderRadius: BorderRadius.circular(40),
                      onTap: () {
                        // Handle onTap for Title 4
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.pink[100],
                            child: Icon(Icons.image, size: 30, color: Colors.white),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Title 4',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),



                      ]
                      )
                      )
                      );


                    }
                  }