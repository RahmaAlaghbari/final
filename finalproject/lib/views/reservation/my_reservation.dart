import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project4/views/hotel/Hotal_detail.dart';

import '../../models/hotel_model.dart';
import '../../models/reservation_model.dart';
import '../../repository/authontication.dart';
import '../../repository/hotel_repo.dart';
import '../../repository/reservation_repo.dart';

class myres extends StatefulWidget {
  @override
  State<myres> createState() => _myresState();
}

class _myresState extends State<myres> {
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
}
var data ={
  'userid': AuthenticationProvider.iduser,
  'hotelid':AuthenticationProvider.idhotel,
};
class _HotelCardState extends State<HotelCard> {
  Future<List<ReservationModel>> _fetchReservations() async {
    try {
      List<ReservationModel> reservations = await ReservationRepository().getByFields(
        data,

      );
      return reservations;
    } catch (e) {
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<ReservationModel>>(
        future: _fetchReservations(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text("Error ${snapshot.error.toString()}"));
            } else if (snapshot.hasData) {
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
                                    "${AuthenticationProvider.namehotel}",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${AuthenticationProvider.pricehotel}',
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
                                '${list[index].fromdate} -> ${list[index].todate}',
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
  }
}