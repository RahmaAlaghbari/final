import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../repository/fav_repo.dart';
import '../../CustomPages/appbar.dart';
import '../../models/comp_model.dart';
import '../../repository/comp_repo.dart';

class CompColumn extends StatefulWidget {
  @override
  State<CompColumn> createState() => _CompColumnState();
}

class _CompColumnState extends State<CompColumn> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {});
      },
      child: SingleChildScrollView(
        child: Column(
          children: [CompCard()],
        ),
      ),
    );
  }
}

class CompCard extends StatefulWidget {
  @override
  State<CompCard> createState() => _CompCardState();
}

class _CompCardState extends State<CompCard> {
  FavRepository _favoriteRepository = FavRepository();
  Set<int> _favoriteItems = Set<int>(); // Keep track of favorite items

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar:   customAppBar(context,'Complaints'),
        body: Container(
        child: FutureBuilder<List<CompModel>>(
          future: CompRepository().getAll(),
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
                          child: Stack(
                            alignment: Alignment.topRight, // Add alignment
                            children: [
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 8.0),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${list[index].email}",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
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
                                  ],
                                ),
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
      );
  }
}