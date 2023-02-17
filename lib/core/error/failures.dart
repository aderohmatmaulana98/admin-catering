import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String messsage;
  final int statusCode;

  const Failure(this.messsage, this.statusCode);

  @override
  List<Object> get props => [messsage, statusCode];
}

class ServerFailure extends Failure {
  const ServerFailure(super.error, super.statusCode);
}

class CacheFailure extends Failure {
  const CacheFailure(super.error, super.statusCode);
}
