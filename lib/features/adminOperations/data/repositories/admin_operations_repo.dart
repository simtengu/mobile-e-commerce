import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/core/failure.dart';
import 'package:e_commerce_app/core/network_data_state.dart';
import 'package:e_commerce_app/core/type_defs.dart';
import 'package:e_commerce_app/features/adminOperations/data/datasources/remote_data_source.dart';
import 'package:e_commerce_app/features/adminOperations/data/models/brand_model.dart';
import 'package:e_commerce_app/features/adminOperations/data/models/category_model.dart';
import 'package:e_commerce_app/features/adminOperations/domain/entities/brand_entity.dart';
import 'package:e_commerce_app/features/adminOperations/domain/entities/category_entity.dart';
import 'package:e_commerce_app/features/adminOperations/domain/repositories/i_admin_operations_repo.dart';
import 'package:e_commerce_app/features/products/data/models/product_model.dart';
import 'package:e_commerce_app/features/products/domain/entities/product_entity.dart';

class AdminOperationsRepo implements IAdminOperationsRepo {
  final RemoteDataSource _remoteDataSource;

  AdminOperationsRepo({required RemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<DataState> createProduct(ProductEntity product) async {
    try {
      await _remoteDataSource.createProduct(ProductModel.fromEntity(product));
      return DataSuccess<String>(data: "product successfully created");
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return DataError(Failure(e.toString(), 501));
    }
  }

  @override
  Future<DataState> fetchProduct(String productId) async {
    try {
      final DocumentSnapshot docSnapshot =
          await _remoteDataSource.fetchProduct(productId);
      final product = ProductModel.fromMap(docSnapshot.data() as BasicMap);
      return DataSuccess<ProductEntity>(data: product);
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return DataError(Failure(e.toString(), 501));
    }
  }

  @override
  Future<DataState> uploadProductImage(
      {required File imageFile, required String imageName}) async {
    try {
      final snapshot =
          await _remoteDataSource.uploadProductImage(imageFile, imageName);

      String imageLink = await snapshot.ref.getDownloadURL();
      return DataSuccess<String>(data: imageLink);
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return DataError(Failure(e.toString(), 501));
    }
  }


    @override
  Future<DataState> deleteProductImage({required String imageUrl})  async {
   
       try {
          await _remoteDataSource.deleteProductImage(imageUrl)  ;


      return DataSuccess<String>(data: 'Image was successfully deleted');
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return DataError(Failure(e.toString(), 501));
    }
  }


  @override
  Future<DataState> fetchBrands() async {
    try {
      final brandsQuerySnapshot = await _remoteDataSource.fetchBrands();
      if (brandsQuerySnapshot.docs.isEmpty) {
        return DataError(Failure("Your brands list is empty", 501));
      }
      List<BrandEntity> brands = [];

      for (var element in brandsQuerySnapshot.docs) {
        brands.add(BrandModel.fromMap(element.data() as BasicMap));
      }

      return DataSuccess<List<BrandEntity>>(data: brands);
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return DataError(Failure(e.toString(), 501));
    }
  }

  @override
  Future<DataState> fetchCategories() async {
    try {
      final categoriesQuerySnapshot = await _remoteDataSource.fetchCategories();
      if (categoriesQuerySnapshot.docs.isEmpty) {
        return DataError(Failure("Your categories list is empty", 501));
      }
      List<CategoryEntity> categories = [];

      for (var element in categoriesQuerySnapshot.docs) {
        categories.add(CategoryModel.fromMap(element.data() as BasicMap));
      }

      return DataSuccess<List<CategoryEntity>>(data: categories);
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return DataError(Failure(e.toString(), 501));
    }
  }
  














}
