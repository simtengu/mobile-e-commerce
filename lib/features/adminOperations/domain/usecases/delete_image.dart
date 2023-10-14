import 'package:e_commerce_app/core/network_data_state.dart';
import 'package:e_commerce_app/features/adminOperations/domain/repositories/i_admin_operations_repo.dart';

class DeleteProductImage {
  final IAdminOperationsRepo _repo;
  DeleteProductImage({required IAdminOperationsRepo repo}): _repo = repo;

  Future<DataState> call(String imageUrl) async {
    return  await _repo.deleteProductImage(imageUrl: imageUrl );
  }

  
}  
  
  
  
  
  
  
  
  
  
  
  
  
