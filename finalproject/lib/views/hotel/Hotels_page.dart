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
import '../setting_page.dart';
import 'Hotal_detail.dart';

class HotelColumn extends StatefulWidget {
  @override
  State<HotelColumn> createState() => _HotelColumnState();
}
String selectedCat ='All Hotels';

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
          color: Colors.grey[300],

          borderRadius: BorderRadius.circular(isDrawerOpen?40:0.0)

      ),
      child: SingleChildScrollView(
          child: Column(
            children: [

            SizedBox(
            height: 0,
          ),
              Material(
                elevation: 5,
                color: Colors.brown[300],

            child: Container(

              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 5),

              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Row(
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
                          icon: Icon(Icons.menu ,size: 30,color: Colors.white,),
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
                          SizedBox(
                            height: 6,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Hotels',style:
                              TextStyle(fontSize: 22,fontWeight:FontWeight.bold,color: Colors.white),),
                            ],
                          ),
                        ],
                      ),
                      CircleAvatar()
                    ],
                  ),
                ],
              ),
            ),
          ),

          Container(

            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            margin: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.brown[100],
                borderRadius: BorderRadius.circular(20)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    // Handle onTap for the search icon
                  },
                  child: Icon(Icons.search),
                ),
                Expanded(
                  child: Text('Search for Hotels..'),
                ),
                GestureDetector(
                  onTap: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPage()),);
                    // Handle onTap for the settings icon
                  },
                  child: Icon(Icons.settings),
                ),
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
                      setState(() {
                        selectedCat = 'All Hotels';
                      });
                    },
                    child: InkWell(
                      borderRadius: BorderRadius.circular(40),
                      onTap: () {
                        setState(() {
                          selectedCat = 'All Hotels';
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: selectedCat == 'All Hotels'
                                ? Colors.teal[300]
                                : Colors.teal[100],
                            child: Icon(Icons.business,
                                size: 30,
                                color: selectedCat == 'All Hotels'
                                    ? Colors.white
                                    : Colors.white),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'All',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: selectedCat == 'All Hotels'
                                  ? Colors.black
                                  : Colors.black26,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 7.0),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCat = 'Luxury Hotels';
                      });
                    },
                    child: InkWell(
                      borderRadius: BorderRadius.circular(40),
                      onTap: () {
                        setState(() {
                          selectedCat = 'Luxury Hotels';
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: selectedCat == 'Luxury Hotels'
                                ? Colors.black45
                                : Colors.black12,
                            child: Icon(Icons.coffee_maker_rounded,
                                size: 30,
                                color: selectedCat == 'Luxury Hotels'
                                    ? Colors.white
                                    : Colors.white),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Luxury',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: selectedCat == 'Luxury Hotels'
                                  ? Colors.black
                                  : Colors.black26,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 7.0),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCat = 'Business Hotels';
                      });
                    },
                    child: InkWell(
                      borderRadius: BorderRadius.circular(40),
                      onTap: () {
                        setState(() {
                          selectedCat = 'Business Hotels';
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: selectedCat == 'Business Hotels'
                                ? Colors.blueGrey[300]
                                : Colors.blueGrey[100],
                            child: Icon(Icons.business_center_sharp,
                                size: 30,
                                color: selectedCat == 'Business Hotels'
                                    ? Colors.white
                                    : Colors.white),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Business',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: selectedCat == 'Business Hotels'
                                  ? Colors.black
                                  : Colors.black26,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 7.0),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCat = 'Resort Hotels';
                      });
                    },
                    child: InkWell(
                      borderRadius: BorderRadius.circular(40),
                      onTap: () {
                        setState(() {
                          selectedCat = 'Resort Hotels';
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: selectedCat == 'Resort Hotels'
                                ? Colors.brown[200]
                                : Colors.brown[100],
                            child: Icon(Icons.sailing_outlined,
                                size: 30,
                                color: selectedCat == 'Resort Hotels'
                                    ? Colors.white
                                    : Colors.white),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Resort',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: selectedCat == 'Resort Hotels'
                                  ? Colors.black
                                  : Colors.black26,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30.0),

              Container(
                color: Colors.brown[100],
                height: 80,// Set your desired background color here
                child: Expanded(
                  child: Center(
                    child: Text(
                      "${selectedCat}",
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),


          Container(




             child: FutureBuilder<List<HotelModel>>(


              // future: HotelRepository().getAll(),
               future: selectedCat == 'All Hotels'
                   ? HotelRepository().getAll()
                   : HotelRepository().getByField('cat', selectedCat),



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
                                setState(() {});

                                HotelRepository().getById(list[index].id.toString());

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HotelDetailsPage(),
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
                                              color: Colors.black45,
                                            ),
                                          );
                                        }
                                      }
                                      return IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.favorite_border,
                                          color: Colors.black45,
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
          ),



          ]
                      )
                      )
                      );


                    }
                  }