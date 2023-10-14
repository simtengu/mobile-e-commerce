import 'dart:convert';

import 'package:e_commerce_app/features/adminOperations/domain/entities/brand_entity.dart';

class BrandModel extends BrandEntity {
  BrandModel({required super.name});


    Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory BrandModel.fromMap(Map<String, dynamic> map) {
    return BrandModel(
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BrandModel.fromJson(String source) => BrandModel.fromMap(json.decode(source) as Map<String, dynamic>);



  
}