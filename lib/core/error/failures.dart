import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String messsage;

  const Failure(this.messsage);

  @override
  List<Object> get props => [messsage];
}

class ServerFailure extends Failure {
  const ServerFailure(super.error);
}

class CacheFailure extends Failure {
  const CacheFailure(super.error);
}
