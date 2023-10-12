import 'package:e_commerce_app/core/failure.dart';

class DataState {
  
}

class DataSuccess<T> extends DataState {
  final T data;
   DataSuccess({required this.data});
  
}



class DataError extends DataState {
  final Failure failure;
  DataError(this.failure); 
  
}