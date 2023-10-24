import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../models/hotel_model.dart';
import '../../models/reservation_model.dart';
import '../../repository/authontication.dart';
import '../../repository/hotel_repo.dart';
import '../../repository/reservation_repo.dart';
import '../CustomPages/appbar.dart';
import '../models/fav_model.dart';
import '../repository/fav_repo.dart';

class Myfav extends StatefulWidget {
  @override
  State<Myfav> createState() => _MyfavState();
}

class _MyfavState extends State<Myfav> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {});
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            HotelCard(),
          ],
        ),
      ),
    );
  }
}

class HotelCard extends StatefulWidget {
  @override
  State<HotelCard> createState() => _HotelCardState();
}class _HotelCardState extends State<HotelCard> {
  Future<List<FavModel>?> _fetchMyfav(String userid) async {
    try {
      List<FavModel> fav = await FavRepository().getByField('userid', AuthenticationProvider.iduser!);
      if (fav.isNotEmpty) {
        return fav;
      }
      return null;
    } catch (e) {
      print(e.toString()); // Handle the error gracefully, e.g., display an error message
      return null;
    }
  }

  Future<HotelModel?> _fetchHotel(String hotelId) async {
    try {
      HotelModel? hotel = await HotelRepository().getById(hotelId);
      return hotel;
    } catch (e) {
      print(e.toString()); // Handle the error gracefully, e.g., display an error message
      return null;
    }
  }

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = true;


  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)..rotateY(isDrawerOpen? 0.5:0),
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
                      isDrawerOpen=true;

                    });
                  },

                ): IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      setState(() {
                        xOffset = 230;
                        yOffset = 150;
                        scaleFactor = 0.6;
                        isDrawerOpen=false;
                      });
                    }),
                Column(
                  children: [
                    Text('Location'),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Color(0xFFA76F6F),
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
                   // Container(
                   //    child: FutureBuilder<List<FavModel>?>(
                   //      future: _fetchMyfav(AuthenticationProvider.iduser!),
                   //      builder: (context, snapshot) {
                   //        if (snapshot.connectionState == ConnectionState.waiting) {
                   //          return Center(child: CircularProgressIndicator());
                   //        } else if (snapshot.connectionState == ConnectionState.done) {
                   //          if (snapshot.hasError) {
                   //            return Center(child: Text("Error ${snapshot.error.toString()}"));
                   //          } else if (snapshot.hasData && snapshot.data != null) {
                   //            List<FavModel> fav = snapshot.data!;
                   //            return ListView.separated(
                   //              shrinkWrap: true,
                   //              physics: NeverScrollableScrollPhysics(),
                   //              itemBuilder: (context, index) {
                   //                FavModel fave = fav[index];
                   //                return FutureBuilder<HotelModel?>(
                   //                  future: _fetchHotel(fave.hotelid!),
                   //                  builder: (context, snapshot) {
                   //                    if (snapshot.connectionState == ConnectionState.waiting) {
                   //                      return Center(child: CircularProgressIndicator());
                   //                    } else if (snapshot.connectionState == ConnectionState.done) {
                   //                      if (snapshot.hasError) {
                   //                        return Center(child: Text("Error ${snapshot.error.toString()}"));
                   //                      } else {
                   //                        HotelModel hotel = snapshot.data ?? HotelModel();
                   //                        return Container(
                   //                          child: Card(
                   //                            elevation: 4.0,
                   //                            shape: RoundedRectangleBorder(
                   //                              borderRadius: BorderRadius.circular(12.0),
                   //                            ),
                   //                            child: InkWell(
                   //                              onTap: () {
                   //                                print("#################################${AuthenticationProvider.idhotel}");
                   //                              },
                   //                              child: Container(
                   //                                width: double.infinity,
                   //                                padding: EdgeInsets.all(16.0),
                   //                                child: Column(
                   //                                  crossAxisAlignment: CrossAxisAlignment.start,
                   //                                  children: [
                   //                                    ClipRRect(
                   //                                      borderRadius: BorderRadius.circular(12.0),
                   //                                      child: hotel.avatar == ''
                   //                                          ? Container(
                   //                                        child: Icon(Icons.image),
                   //                                        width: 50,
                   //                                        height: 50,
                   //                                      )
                   //                                          : Image.network(
                   //                                        hotel.avatar!,
                   //                                        width: double.infinity,
                   //                                        height: 150.0,
                   //                                        fit: BoxFit.cover,
                   //                                      ),
                   //                                    ),
                   //                                    SizedBox(height: 8.0),
                   //                                    Row(
                   //                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   //                                      children: [
                   //                                        Text(
                   //                                          "${hotel.name}",
                   //                                          style: TextStyle(
                   //                                            fontSize: 20.0,
                   //                                            fontWeight: FontWeight.bold,
                   //                                          ),
                   //                                        ),
                   //                                        Text(
                   //                                          '${hotel.price}',
                   //                                          style: TextStyle(
                   //                                            fontSize: 18.0,
                   //                                            fontWeight: FontWeight.bold,
                   //                                            color: Colors.black,
                   //                                          ),
                   //                                        ),
                   //                                      ],
                   //                                    ),
                   //
                   //                                    SizedBox(height: 8.0),
                   //                                    Text(
                   //                                      '${hotel.descnmae}',
                   //                                      style: TextStyle(
                   //                                        fontSize: 16.0,
                   //                                        color: Colors.grey[600],
                   //                                      ),
                   //                                    ),
                   //                                    SizedBox(height: 8.0),
                   //                                    RatingBar.builder(
                   //                                      minRating: 1,
                   //                                      direction: Axis.horizontal,
                   //                                      allowHalfRating: true,
                   //                                      itemCount: 5,
                   //                                      itemSize: 24,
                   //                                      itemBuilder: (context, _) => Icon(
                   //                                        Icons.star,
                   //                                        color: Colors.amber,
                   //                                      ),
                   //                                      onRatingUpdate: (rating) {
                   //                                        // Handle rating update
                   //                                      },
                   //                                    ),
                   //                                  ],
                   //                                ),
                   //                              ),
                   //
                   //                            ),
                   //                          ),
                   //                        );
                   //                      }
                   //                    } else {
                   //                      return Center(child: Text("Errorloading hotel data"));
                   //                    }
                   //                  },
                   //                );
                   //              },
                   //              separatorBuilder: (context, index) {
                   //                return SizedBox(height: 16.0);
                   //              },
                   //              itemCount: fav.length,
                   //            );
                   //          } else {
                   //            return Center(child: Text("No data available"));
                   //          }
                   //        } else {
                   //          return Center(child: Text("Error loading data"));
                   //        }
                   //      },
                   //    ),
                   // ),

            ]
          )
      )
    );


  }
}