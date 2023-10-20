import 'package:dio/dio.dart';

import '../models/hotel_model.dart';
import '../models/reservation_model.dart';


class ReservationRepository{
  late Dio dio ;
  ReservationRepository(){
    dio = Dio();
    dio.options.connectTimeout = Duration(seconds: 10);
    dio.options.responseType = ResponseType.json;
  }

  Future<List<ReservationModel>> getAll()async{

    try{
      // await Future.delayed(Duration(milliseconds: 300));
      var res = await dio.get('https://652b9ff8d0d1df5273ee8a8e.mockapi.io/hotels2/reservation');
      List<ReservationModel> items = [];
      if(res.statusCode == 200){
        var data = res.data as List;
        if(data.isNotEmpty){
          for (var e in data) {
            items.add(ReservationModel.fromJson(e));
          }
          return items;
        }
      }

      return items;
    }
    catch(ex){
      rethrow;
    }
  }


  Future<ReservationModel?> getById(String id) async {
    try {
      var apiUrl = 'https://652b9ff8d0d1df5273ee8a8e.mockapi.io/hotels2/reservation/$id';
      var response = await dio.get(apiUrl); // Make the API request using Dio

      if (response.statusCode == 200) {
        var res = response.data;

        return  ReservationModel.fromJson(res);
      }

      return null;
    }  catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

  Future<Object> addd(ReservationModel obj)async{
    print("###################################${obj}");
    try{


      await Future.delayed(Duration(milliseconds: 3000));
      var addRes = await dio.post('https://652b9ff8d0d1df5273ee8a8e.mockapi.io/hotels2/reservation', data: obj.toJson());
      print("###########################################add res: ${addRes}");
      if (addRes.statusCode == 200) {

        var data = addRes.data;
        var prod = ReservationModel.fromJson(data);
        if(prod != null){
          return prod.id??0;
        }
        else{
          return 0;
        }
      }

      return 0;
    }
    catch(ex){
      rethrow;
    }
  }



  }
