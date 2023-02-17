import 'package:cathering_mobile/core/error/failures.dart';
import 'package:cathering_mobile/features/login/domain/entities/login.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository {
  Future<Either<Failure, Login>>? postLogin(String username, String password);
}