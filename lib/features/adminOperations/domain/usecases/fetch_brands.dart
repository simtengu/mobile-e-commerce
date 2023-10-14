import 'package:e_commerce_app/core/network_data_state.dart';
import 'package:e_commerce_app/features/adminOperations/domain/repositories/i_admin_operations_repo.dart';

class FetchBrands {
  final IAdminOperationsRepo _repo;
  FetchBrands({required IAdminOperationsRepo repo}): _repo = repo;

  Future<DataState> call() async {
    return  await _repo.fetchBrands();
  }

  
}