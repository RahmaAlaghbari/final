import 'dart:io';

import 'package:flutter/material.dart';

import '../../../CustomPages/appbar.dart';
import '../../../models/hotel_model.dart';
import '../../../repository/hotel_repo.dart';
import 'add_hotel.dart';
import 'delete_hotel.dart';
import 'edit_hotel.dart';


class HotelView extends StatefulWidget {
  const HotelView({Key? key}) : super(key: key);

  @override
  State<HotelView> createState() => _HotelView();
}

class _HotelView extends State<HotelView> {
  @override
  Widget build(BuildContext context) {
    return
      RefreshIndicator(
        onRefresh: ()async{
          setState(() {

          });
        },
        child: Scaffold(
          appBar:   customAppBar(context,'Hotels'),
          floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
              onPressed: ()async{
                var isAdd=await  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => hotelAdd()),
                );
                if(isAdd!=null && isAdd==true){
                  setState(() {

                  });
                }
              }),

          body: Container(child: FutureBuilder<List<HotelModel>>(
            future: HotelRepository().getAll(),

            builder: (context,snapshot){
              if(snapshot.connectionState ==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }

              else if(snapshot.connectionState ==ConnectionState.done){
                if(snapshot.hasError)
                  return Center(child: Text("Error ${snapshot.error.toString()}"));
                else if(snapshot.hasData){
                  var list=snapshot.data??[];
                  return ListView.separated(
                      itemBuilder: (context,index){
                        return ListTile(leading: list[index].avatar == ''
                            ? Container(child: Icon(Icons.image),width: 50,height: 50,)

                            :ClipOval(
                          child: Image.network(
                            list[index].avatar!,
                            height: 50,
                            width: 56,
                            fit: BoxFit.fill,
                          ),
                        ),
                            title: Text("${list[index].name}"),
                            subtitle:Row(children: [

                              Text("${list[index].descnmae}" ,),
                              SizedBox(width: 50,),
                              Text("${list[index].description}" ,style: TextStyle(color: Colors.red),),
                            ],),


                            trailing:


                            Row(mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    // Handle the update action here
                                    // For example, navigate to the update screen
                                    var isUpdated =
                                    await Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => HotelUpdate(
                                            hotelId: list[index].id.toString(),
                                        ),
                                      ),
                                    );
                                    if (isUpdated != null &&
                                        isUpdated == true) {
                                      setState(() {});
                                    }
                                  },
                                  icon: Icon(Icons.edit),
                                ),



                                IconButton(
                                  onPressed: () async {
                                    print(list[index].id);
                                    var delRes = await showDialog(
                                      context: context,
                                      builder: (context) {
                                        return HotelDelete(itemId: list[index].id.toString());
                                      },
                                    );
                                    if (delRes != null && delRes == true) {
                                      setState(() {});
                                    }
                                  },
                                  icon: Icon(Icons.delete),
                                ),
                              ],
                            )









                        );
                      },
                      separatorBuilder: (context,index){
                        return Divider();

                      },
                      itemCount: list.length);
                }
                else{
                  return Center(child: Text("Error ${snapshot.error.toString()}"));

                }

              }
              else{
                return Center(child: Text("Error ${snapshot.error.toString()}"));

              }

            },),),
        ),
      );
  }
}
