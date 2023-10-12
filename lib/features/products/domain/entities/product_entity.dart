
import 'package:equatable/equatable.dart';
class ProductEntity extends Equatable {

final String id;
    final String title;
    final String description;
  final List<String> pictures;
  final double price;
  final String category;
  final String brand;
  final String createdAt;

 const ProductEntity({
  required this.id,
    required this.title,
    required this.description,
    required this.pictures,
    required this.price,
    required this.category,
    required this.brand,
    required this.createdAt,
  });

  @override
  List<Object> get props {
    return [
      id,
      title,
    ];
  }
  


}