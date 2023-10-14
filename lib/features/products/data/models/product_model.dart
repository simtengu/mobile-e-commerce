import 'dart:convert';
import 'package:e_commerce_app/core/type_defs.dart';
import 'package:e_commerce_app/features/products/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.title,
    required super.description,
    required super.pictures,
    required super.price,
    required super.category,
    required super.brand,
    required super.createdAt,
  });

  ProductModel copyWith({
    String? id,
    String? title,
    String? description,
    List<String>? pictures,
    double? price,
    String? category,
    String? brand,
    String? createdAt,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      pictures: pictures ?? this.pictures,
      price: price ?? this.price,
      category: category ?? this.category,
      brand: brand ?? this.brand,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      
      'title': title,
      'description': description,
      'pictures': pictures,
      'price': price,
      'category': category,
      'brand': brand,
      'createdAt': createdAt,
    };
  }

  factory ProductModel.fromMap(BasicMap map) {
    return ProductModel(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      pictures: List<String>.from(map['pictures'])  ,
      price: map['price'] as double,
      category: map['category'] as String,
      brand: map['brand'] as String,
      createdAt: map['createdAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as BasicMap);

  @override
  bool get stringify => true;

  factory ProductModel.dummyProduct() =>  const ProductModel(
        id: 'theid',
        title: 'the title',
        description: 'the desc',
        pictures: ['img'],
        price: 300.4,
        category: "category",
        brand: "brand",
        createdAt: "created at",
      );

  factory ProductModel.fromEntity(ProductEntity item) => ProductModel(
      id: item.id,
      title: item.title,
      description: item.description,
      pictures: item.pictures,
      price: item.price,
      category: item.category,
      brand: item.brand,
      createdAt: item.createdAt);
}
