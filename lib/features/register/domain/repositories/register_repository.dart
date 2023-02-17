import 'package:cathering_mobile/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterRepository {
  Future<Either<Failure, void>>? postRegister({
  required final String userame,
  required final String password,
  required final String name,
  required final String phone,
  required final String address,
  required final String email,
  required final String gender,
  });
}