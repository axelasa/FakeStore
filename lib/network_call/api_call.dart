import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../model/products.dart';
class GetAllProductsRepo{
Future <List<Products>> getAllProducts() async {
  //Map data = {};
  try{
    var url =Uri.parse("https://fakestoreapi.com/products");
    http.Response response = await http.get(url);
    if (response.statusCode == 200){
      String responseBody = response.body;
      List<dynamic> data = jsonDecode(responseBody);

      List<Products> list = data.map((e) => Products.fromJson(e as Map<String,dynamic>)).toList();
      if (kDebugMode) {
        print("HERE IS THE LIST ${list.length}");
      }
      return list;
    }else{
      throw Exception(response.reasonPhrase);
    }

  }catch(e){
    if (kDebugMode) {
      print(e.toString());
    }
    return [];
  }
}
}

  Future<Products?> getSingleProduct(int id) async{
    Map data ={};
    try{
      var url = Uri.parse("https://fakestoreapi.com/products/$id");
      http.Response response = await http.get(url);
      data = jsonDecode(response.body);
      if (response.statusCode == 200){
        return Products.fromJson(data as Map<String,dynamic>);
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

  Future<AllCategories?>getAllCategoriesRepo() async{
  try{
    var url = Uri.parse("https://fakestoreapi.com/products/categories");
    http.Response response = await http.get(url);
    if(response.statusCode == 200){
      String responseBody = response.body;
      if (kDebugMode) {
        print('Here is the Data $responseBody');
      }
      List<dynamic> data = jsonDecode(responseBody);
      if (kDebugMode) {
        print('Here is the category Data ${data.length}');
        print('this is an item ${data.first}');
      }

      List<String> res = [];
      for (var resources in data){
        res.add(resources.toString());
      }
      return AllCategories(categories: res);

    }else{
      throw Exception(response.reasonPhrase);
    }
  }catch(e){
    if (kDebugMode) {
      print(e.toString());
    }
  }
  return null;
}

Future<List<Products>>getProductsInSpecificCategory(String category) async{
  
  try{
    var url = Uri.parse("https://fakestoreapi.com/products/category/$category");
    http.Response response = await http.get(url);

    if(response.statusCode == 200){
      var responseBody = response.body;
      List<dynamic> data = jsonDecode(responseBody);
      List<Products> list = data.map((e) => Products.fromJson(e as Map<String,dynamic>)).toList();
      if (kDebugMode) {
        print("HERE IS THE LIST ${list.length}");
      }
      return list;
    }else{
      throw Exception(response.reasonPhrase);
    }

  }catch(e){
    if (kDebugMode) {
      print(e.toString());
    }
  }
  return [];
}

Future<List<Products>>getLimitedResults(int range) async{

  try{
    var url = Uri.parse("https://fakestoreapi.com/products?limit=$range");
    http.Response response = await http.get(url);

    if(response.statusCode == 200){
      var responseBody = response.body;
      List<dynamic> data = jsonDecode(responseBody);
      List<Products> list = data.map((e) => Products.fromJson(e as Map<String,dynamic>)).toList();
      if (kDebugMode) {
        print("HERE IS THE LIST ${list.length}");
      }
      return list;
    }else{
      throw Exception(response.reasonPhrase);
    }

  }catch(e){
    if (kDebugMode) {
      print(e.toString());
    }
  }
  return [];
}
