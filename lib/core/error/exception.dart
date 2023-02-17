import 'package:cathering_mobile/core/error/model/error.dart';

class ServerException implements Exception {
  final ErrorModel error;

  ServerException({required this.error});
}

class CacheException implements Exception {
  final String message;

  CacheException({required this.message});
}