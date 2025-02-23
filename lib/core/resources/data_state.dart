import 'package:dio/dio.dart';

// class for handling the response whether success or failure
abstract class DataState<T> {
  final T? data;
  final DioException? error;
  const DataState({this.data, this.error});
}

class DataSucces<T> extends DataState<T> {
  const DataSucces(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(DioException error) : super(error: error);
}
