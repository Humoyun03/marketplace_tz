import 'package:flutter/cupertino.dart';

class ProductModel{
  String name;
  String image;
  String capacity;
  int price;

  ProductModel({required this.name, required this.image, required this.capacity, required this.price,});

  ProductModel.fromMap(Map<dynamic, dynamic> item):
        name= item["name"],
        image= item["image"],
        capacity= item["capacity"],
        price= item["price"];

  Map<String, dynamic> toMap(){
    return {
      'name': name,
      'image': image,
      'capacity': capacity,
      'price': price
    };
  }
}