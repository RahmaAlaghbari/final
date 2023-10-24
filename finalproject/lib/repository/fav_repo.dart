
import 'package:dio/dio.dart';
import '../models/fav_model.dart';


class FavRepository{
  late Dio dio ;
  FavRepository(){
    dio = Dio();
    dio.options.connectTimeout = Duration(seconds: 20);
    dio.options.responseType = ResponseType.json;
  }

  Future<List<FavModel>> getAll()async{

    try{
      // await Future.delayed(Duration(milliseconds: 300));
      var res = await dio.get('https://652b9ff8d0d1df5273ee8a8e.mockapi.io/hotels2/reservation');
      List<FavModel> items = [];
      if(res.statusCode == 200){
        var data = res.data as List;
        if(data.isNotEmpty){
          for (var e in data) {
            items.add(FavModel.fromJson(e));
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


  Future<FavModel?> getById(String id) async {
    try {
      var apiUrl = 'https://652b9ff8d0d1df5273ee8a8e.mockapi.io/hotels2/reservation/$id';
      var response = await dio.get(apiUrl); // Make the API request using Dio

      if (response.statusCode == 200) {
        var res = response.data;

        return  FavModel.fromJson(res);
      }

      return null;
    }  catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

  Future<Object> addd(FavModel obj)async{
    print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${obj}");
    try{

      await Future.delayed(Duration(milliseconds: 3000));
      var addRes = await dio.post('https://652b9ff8d0d1df5273ee8a8e.mockapi.io/hotels2/reservation', data: obj.toJson());
      print("###########################################add res: ${addRes}");
      if (addRes.statusCode == 200) {

        var data = addRes.data;
        var prod = FavModel.fromJson(data);

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
  Future<List<FavModel>> getByField(String fieldName, String fieldValue) async {
    try {
      var apiUrl = 'https://652b9ff8d0d1df5273ee8a8e.mockapi.io/hotels2/reservation';
      var response = await dio.get(apiUrl); // Make the API request using Dio

      if (response.statusCode == 200) {
        var res = response.data;
        List<FavModel> fav = [];

        for (var item in res) {
          if (item[fieldName] == fieldValue) {
            fav.add(FavModel.fromJson(item));
          }
        }

        return fav;
      }

      return [];
    }  catch (e) {
      print('Error: $e');
      rethrow;
    }
  }
  Future<Object> deletee(String userId) async {
    try {
      await Future.delayed(Duration(milliseconds: 300));
      var deleteRes = await dio.delete(
        'https://65253db067cfb1e59ce6f039.mockapi.io/hotelusers/users/$userId',
      );
      print("###########################################delete res: $deleteRes");
      if (deleteRes.statusCode == 200) {
        var data = deleteRes.data;
        var prod = FavModel.fromJson(data);
        if (prod != null) {
          return prod.id ?? 0;
        } else {
          // Handle error response or unexpected data
          throw Exception('Unexpected response data');
        }
      } else {
        // Handle error response
        throw Exception('Failed to delete favorite');
      }
    } catch (ex) {
      rethrow;
    }
  }
}