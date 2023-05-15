import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../model/products.dart';
class GetAllProductsRepo{
Future <GetAllProducts?> getAllProducts() async {
  Map data = {};
  try{
    var url =Uri.parse("https://fakestoreapi.com/products");
    http.Response response = await http.get(url);
    data = jsonDecode(response.body);
    if (response.statusCode == 200){
      return GetAllProducts.fromJson(data as Map<String,dynamic>);
    }else{
      throw Exception(response.reasonPhrase);
    }

  }catch(e){
    if (kDebugMode) {
      print(e.toString());
    }
    return null;
  }
}
}
class GetSingleProductRepo{
  Future<GetAllProducts?> getSingleProduct(int id) async{
    Map data ={};

    try{
      var url = Uri.parse("https://fakestoreapi.com/products/$id");
      http.Response response = await http.get(url);
      data = jsonDecode(response.body);
      if (response.statusCode == 200){
        return GetAllProducts.fromJson(data as Map<String,dynamic>);
      }else{
        throw Exception(response.reasonPhrase);
      }

    }catch(e){
      if(kDebugMode){
        print(e.toString());
      }
    }
    return null;
  }
}
