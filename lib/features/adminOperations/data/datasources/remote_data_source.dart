import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/products/data/models/product_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class IRemoteDataSource {
  Future createProduct(ProductModel productInfo);

  Future fetchProduct(String productId);
  Future uploadProductImage(File imageFile, String imageName);
  Future<void> deleteProductImage(String imageUrl);
  Future<QuerySnapshot> fetchBrands();
  Future<QuerySnapshot> fetchCategories();
}

class RemoteDataSource implements IRemoteDataSource {
  final FirebaseFirestore _firebase;
  final FirebaseStorage _firebaseStorage;

  RemoteDataSource(
      {required FirebaseFirestore firestore,
      required FirebaseStorage firebaseStorage})
      : _firebase = firestore,
        _firebaseStorage = firebaseStorage;

//collections.....................................
//products collection.
  CollectionReference get _products =>
      _firebase.collection(FirebaseConstants.products);

  CollectionReference get _brands =>
      _firebase.collection(FirebaseConstants.brands);
  CollectionReference get _categories =>
      _firebase.collection(FirebaseConstants.categories);

//methods overrides...........................................

  @override
  Future createProduct(ProductModel product) {
    return _products.add(product.toMap());
  }

  @override
  Future fetchProduct(String productId) {
    return _products.doc(productId).get();
  }

  @override
  Future<TaskSnapshot> uploadProductImage(
      File imageFile, String imageName) async {
    final ref = _firebaseStorage.ref().child('productImages').child(imageName);
    return await ref.putFile(imageFile);
  }

  @override
  Future<QuerySnapshot<Object?>> fetchBrands() {
    return _brands.get();
  }

  @override
  Future<QuerySnapshot<Object?>> fetchCategories() {
    return _categories.get();
  }
  
  @override
  Future<void> deleteProductImage(String imageUrl) {


   // Convert the URL to a storage reference
      Reference imageReference = _firebaseStorage.refFromURL(imageUrl);

      // Delete the image using the reference
      return imageReference.delete();
  }
}
