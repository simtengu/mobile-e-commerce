import 'dart:io';

import 'package:e_commerce_app/core/network_data_state.dart';
import 'package:e_commerce_app/features/products/domain/entities/product_entity.dart';

abstract class IAdminOperationsRepo {

  
Future<DataState> createProduct(ProductEntity productInfo);
Future<DataState> fetchProduct(String productId);
Future<DataState> fetchBrands();
Future<DataState> fetchCategories();
Future<DataState> uploadProductImage({required File imageFile,required String imageName});
Future<DataState> deleteProductImage({required String imageUrl});
  
  
}