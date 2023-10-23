import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../models/hotel_model.dart';
import '../../models/reservation_model.dart';
import '../../repository/authontication.dart';
import '../../repository/hotel_repo.dart';
import '../../repository/reservation_repo.dart';

class MyReservations extends StatefulWidget {
  @override
  State<MyReservations> createState() => _MyReservationsState();
}

class _MyReservationsState extends State<MyReservations> {
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
  Future<List<ReservationModel>?> _fetchReservations(String userid) async {
    try {
      List<ReservationModel> reservations = await ReservationRepository().getByField('userid', AuthenticationProvider.iduser!);
      if (reservations.isNotEmpty) {
        return reservations;
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<ReservationModel>?>(
        future: _fetchReservations(AuthenticationProvider.iduser!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text("Error ${snapshot.error.toString()}"));
            } else if (snapshot.hasData && snapshot.data != null) {
              List<ReservationModel> reservations = snapshot.data!;
              return ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  ReservationModel reservation = reservations[index];
                  return FutureBuilder<HotelModel?>(
                    future: _fetchHotel(reservation.hotelid!),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Center(child: Text("Error ${snapshot.error.toString()}"));
                        } else {
                          HotelModel hotel = snapshot.data ?? HotelModel();
                          return Container(
                            child: Card(
                              elevation: 4.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: InkWell(
                                onTap: () {
                                  print("#################################${AuthenticationProvider.idhotel}");
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 8.0),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${hotel.name}",
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            '${hotel.price}',
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
                                        '${reservation.fromdate} -> ${reservation.todate}',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      SizedBox(height: 8.0),
                                      RatingBar.builder(
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
                              ),
                            ),
                          );
                        }
                      } else {
                        return Center(child: Text("Errorloading hotel data"));
                      }
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 16.0);
                },
                itemCount: reservations.length,
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
  }
}