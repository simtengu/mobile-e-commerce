import 'package:e_commerce_app/core/network_data_state.dart';
import 'package:e_commerce_app/features/adminOperations/domain/repositories/i_admin_operations_repo.dart';
import 'package:e_commerce_app/features/products/domain/entities/product_entity.dart';

class CreateProduct {
  final IAdminOperationsRepo _repo;
  CreateProduct({required IAdminOperationsRepo repo}): _repo = repo;

  Future<DataState> createProduct(ProductEntity product) async {
    return  await _repo.createProduct(product);
  }

  
}