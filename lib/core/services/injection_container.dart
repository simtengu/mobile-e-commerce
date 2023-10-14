import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/features/adminOperations/data/datasources/remote_data_source.dart';
import 'package:e_commerce_app/features/adminOperations/data/repositories/admin_operations_repo.dart';
import 'package:e_commerce_app/features/adminOperations/domain/repositories/i_admin_operations_repo.dart';
import 'package:e_commerce_app/features/adminOperations/domain/usecases/create_product.dart';
import 'package:e_commerce_app/features/adminOperations/domain/usecases/delete_image.dart';
import 'package:e_commerce_app/features/adminOperations/domain/usecases/fetch_brands.dart';
import 'package:e_commerce_app/features/adminOperations/domain/usecases/fetch_categories.dart';
import 'package:e_commerce_app/features/adminOperations/domain/usecases/upload_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> init() async {
  sl
  //usecases...............................
    ..registerLazySingleton(() => CreateProduct(repo: sl()))
    ..registerLazySingleton(() => FetchBrands(repo: sl()))
    ..registerLazySingleton(() => FetchCategories(repo: sl()))
    ..registerLazySingleton(() => UploadImage(repo: sl()))
    ..registerLazySingleton(() => DeleteProductImage(repo: sl()))
    //repo interfaces................................
    ..registerLazySingleton<IAdminOperationsRepo>(
        () => AdminOperationsRepo(remoteDataSource: sl()))
        // data source.......................
    ..registerLazySingleton(() => RemoteDataSource(
        firebaseStorage: FirebaseStorage.instance,
        firestore: FirebaseFirestore.instance));
}
