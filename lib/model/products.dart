import 'dart:convert';
import 'dart:core';
import 'package:json_annotation/json_annotation.dart';

part 'products.g.dart';

@JsonSerializable()
class GetAllProducts {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  GetAllProducts({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory GetAllProducts.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductsFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllProductsToJson(this);

  @override
  String toString() => jsonEncode(this);
}

@JsonSerializable()
class Rating {
  double? rate;
  int? count;

  Rating({
    this.rate,
    this.count,
  });

  factory Rating.fromJson(Map<String,dynamic> json) => _$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);
  @override
  String toString() => jsonEncode(this);
}
