// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BrandEntity {

  final String name;
  BrandEntity({
    required this.name,
  });
  


  @override
  bool operator ==(covariant BrandEntity other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
