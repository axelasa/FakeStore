import 'dart:convert';
import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'products.g.dart';

@JsonSerializable()
class Products {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  Products({
       this.id, 
       this.title, 
       this.price, 
       this.description, 
       this.category, 
       this.image, 
       this.rating,
  });

  factory Products.fromJson( Map<String, dynamic> json) => _$ProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsToJson(this);

}

@JsonSerializable()
class Rating {
  double? rate;
  int? count;

  Rating({
    this.rate,
    this.count,});

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);

}
@JsonSerializable()
class AllCategories{
  List<String>? categories;

  AllCategories({
    this.categories,
});
  factory AllCategories.fromJson(Map<String,dynamic>json) => _$AllCategoriesFromJson(json);

  Map<String,dynamic>toJson()=>_$AllCategoriesToJson(this);

  @override
  String toString() => jsonEncode(this);
}

@JsonSerializable()
class GetCart {
  int? id;
  int? userId;
  String? date;
  List<Product>? products;

  GetCart({
    this.id,
    this.userId,
    this.date,
    this.products,});

  factory GetCart.fromJson(Map<String,dynamic>json) => _$GetCartFromJson(json);


  Map<String, dynamic> toJson() => _$GetCartToJson(this);

  @override
  String toString() => jsonEncode(this);

}
@JsonSerializable()
class Product{
  int? productId;
  int? quantity;

  Product({
    this.productId,
    this.quantity
});
  factory Product.fromJson(Map<String,dynamic>json) => _$ProductFromJson(json);

  Map<String,dynamic> toJson()=> _$ProductToJson(this);

  @override
  String toString() => jsonEncode(this);
}