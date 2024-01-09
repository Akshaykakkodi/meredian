import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meredian/model/api_response_model.dart';

class APiController extends ChangeNotifier {
  final Dio dio = Dio();
  bool isLoading=false;

  ApiModel? apimodel;

   fetchData() async {
    isLoading=true;
    try {
      
      var response = await dio.get("https://dummyjson.com/comments");
      apimodel = ApiModel.fromJson(response.data);
isLoading=false;
notifyListeners();
return apimodel;
      
    } catch (e) {
      throw e.toString();
    }
    
  }
}
