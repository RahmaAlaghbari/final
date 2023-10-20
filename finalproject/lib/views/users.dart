import 'dart:io';

import 'package:flutter/material.dart';

import '../CustomPages/appbar.dart';
import '../models/user_model.dart';
import '../repository/user_repo.dart';
import 'add_user.dart';
import 'delete_user.dart';
import 'edit_user.dart';

class UserView extends StatefulWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  State<UserView> createState() => _UserView();
}

class _UserView extends State<UserView> {
  @override
  Widget build(BuildContext context) {
    return
      RefreshIndicator(
        onRefresh: ()async{
          setState(() {

          });
        },
        child: Scaffold(
          appBar: SearchAppBar(),
          floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
              onPressed: ()async{
                var isAdd=await  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => userAdd()),
                );
                if(isAdd!=null && isAdd==true){
                  setState(() {

                  });
                }
              }),

          body: Container(child: FutureBuilder<List<UserModel>>(
            future: UserRepository().getAll(),

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
                        return ListTile(leading: list[index].img == ''
                            ? Container(child: Icon(Icons.image),width: 50,height: 50,)

                            :ClipOval(
                          child: Image.network(
                            list[index].img!,
                            height: 50,
                            width: 56,
                            fit: BoxFit.fill,
                          ),
                        ),
                            title: Text("${list[index].fName}"),
                            subtitle:Row(children: [

                              Text("${list[index].email}" ,),
                              SizedBox(width: 50,),
                              Text("${list[index].gender}" ,style: TextStyle(color: Colors.red),),
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
                                        builder: (context) => UserUpdate(
                                            userId: list[index].id.toString(),
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
                                        return UserDelete(itemId: list[index].id.toString());
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
