import 'package:dio/dio.dart';

import '../models/hotel_model.dart';
import 'authontication.dart';


class HotelRepository{
  late Dio dio ;
  HotelRepository(){
    dio = Dio();
    dio.options.connectTimeout = Duration(seconds: 10);
    dio.options.responseType = ResponseType.json;
  }

  Future<List<HotelModel>> getAll()async{

    try{
      // await Future.delayed(Duration(milliseconds: 300));
      var res = await dio.get('https://65253db067cfb1e59ce6f039.mockapi.io/hotelusers/hotels');
      List<HotelModel> items = [];
      if(res.statusCode == 200){
        var data = res.data as List;
        if(data.isNotEmpty){
          for (var e in data) {
            items.add(HotelModel.fromJson(e));
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


  Future<HotelModel?> getById(String id) async {
    try {
      var apiUrl = 'https://65253db067cfb1e59ce6f039.mockapi.io/hotelusers/hotels/$id';
      var response = await dio.get(apiUrl); // Make the API request using Dio

      if (response.statusCode == 200) {
        var res = response.data;

        AuthenticationProvider.hotel(res["id"],res["name"],res["price"]);
        print("###################################${res["id"]}");

        return  HotelModel.fromJson(res);
      }

      return null;
    }  catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

  Future<Object> addd(HotelModel obj)async{
    try{
      await Future.delayed(Duration(milliseconds: 300));
      var addRes = await dio.post('https://65253db067cfb1e59ce6f039.mockapi.io/hotelusers/hotels', data: obj.toJson());
      print("###########################################add res: ${addRes}");
      if (addRes.statusCode == 200) {

        var data = addRes.data;
        var prod = HotelModel.fromJson(data);
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


  Future<Object> editt(HotelModel obj) async {
    try {
      await Future.delayed(Duration(milliseconds: 300));
      var editRes = await dio.put(
        'https://65253db067cfb1e59ce6f039.mockapi.io/hotelusers/hotels/${obj.id}',
        data: obj.toJson(),
      );
      print("###########################################edit res: $editRes");
      if (editRes.statusCode == 200) {
        print("###########################################edit res: $editRes");

        var data = editRes.data;
        var prod = HotelModel.fromJson(data);

        if (prod != null) {

          return prod.id ?? 0;

        } else {
          // Handle error response or unexpected data
          throw Exception('Unexpected response data');
        }
      }   else {
        // Handle error response
        throw Exception('Failed to update Hotel');
      }
    } catch (ex) {
      rethrow;
    }
  }
  Future<Object> deletee(String hotelId) async {
    try {
      await Future.delayed(Duration(milliseconds: 300));
      var deleteRes = await dio.delete(
        'https://65253db067cfb1e59ce6f039.mockapi.io/hotelusers/hotels/$hotelId',
      );
      print("###########################################delete res: $deleteRes");
      if (deleteRes.statusCode == 200) {
        var data = deleteRes.data;
        var prod = HotelModel.fromJson(data);
        if (prod != null) {
          return prod.id ?? 0;
        } else {
          // Handle error response or unexpected data
          throw Exception('Unexpected response data');
        }
      } else {
        // Handle error response
        throw Exception('Failed to delete Hotel');
      }
    } catch (ex) {
      rethrow;
    }
  }
}