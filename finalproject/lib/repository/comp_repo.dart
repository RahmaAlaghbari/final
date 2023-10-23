
import 'package:dio/dio.dart';
import '../models/comp_model.dart';


class CompRepository{
  late Dio dio ;
  CompRepository(){
    dio = Dio();
    dio.options.connectTimeout = Duration(seconds: 10);
    dio.options.responseType = ResponseType.json;
  }

  Future<List<CompModel>> getAll()async{

    try{
      // await Future.delayed(Duration(milliseconds: 300));
      var res = await dio.get('https://652ba1e3d0d1df5273ee8d34.mockapi.io/hotels3/comp');
      List<CompModel> items = [];
      if(res.statusCode == 200){
        var data = res.data as List;
        if(data.isNotEmpty){
          for (var e in data) {
            items.add(CompModel.fromJson(e));
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


  Future<CompModel?> getById(String id) async {
    try {
      var apiUrl = 'https://652ba1e3d0d1df5273ee8d34.mockapi.io/hotels3/comp/$id';
      var response = await dio.get(apiUrl); // Make the API request using Dio

      if (response.statusCode == 200) {
        var res = response.data;

        return  CompModel.fromJson(res);
      }

      return null;
    }  catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

  Future<Object> addd(CompModel obj)async{
    print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${obj}");
    try{

      await Future.delayed(Duration(milliseconds: 3000));
      var addRes = await dio.post('https://652ba1e3d0d1df5273ee8d34.mockapi.io/hotels3/comp', data: obj.toJson());
      print("###########################################add res: ${addRes}");
      if (addRes.statusCode == 200) {

        var data = addRes.data;
        var prod = CompModel.fromJson(data);

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
  Future<List<CompModel>> getByField(String fieldName, String fieldValue) async {
    try {
      var apiUrl = 'https://652ba1e3d0d1df5273ee8d34.mockapi.io/hotels3/comp';
      var response = await dio.get(apiUrl); // Make the API request using Dio

      if (response.statusCode == 200) {
        var res = response.data;
        List<CompModel> comp = [];

        for (var item in res) {
          if (item[fieldName] == fieldValue) {
            comp.add(CompModel.fromJson(item));
          }
        }

        return comp;
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
        'https://652ba1e3d0d1df5273ee8d34.mockapi.io/hotels3/comp/$userId',
      );
      print("###########################################delete res: $deleteRes");
      if (deleteRes.statusCode == 200) {
        var data = deleteRes.data;
        var prod = CompModel.fromJson(data);
        if (prod != null) {
          return prod.id ?? 0;
        } else {
          // Handle error response or unexpected data
          throw Exception('Unexpected response data');
        }
      } else {
        // Handle error response
        throw Exception('Failed to delete complaints');
      }
    } catch (ex) {
      rethrow;
    }
  }
}