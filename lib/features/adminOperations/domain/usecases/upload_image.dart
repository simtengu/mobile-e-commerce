import 'dart:io';
import 'package:e_commerce_app/core/network_data_state.dart';
import 'package:e_commerce_app/features/adminOperations/domain/repositories/i_admin_operations_repo.dart';

class UploadImage {
  final IAdminOperationsRepo _repo;
  UploadImage({required IAdminOperationsRepo repo}): _repo = repo;

  Future<DataState> uploadImage({required File imageFile, required String imageName}) async {
    return await _repo.uploadProductImage(imageFile: imageFile,imageName: imageName);
  }

  
}