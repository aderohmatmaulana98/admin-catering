import 'package:cathering_mobile/core/error/failures.dart';
import 'package:cathering_mobile/core/usecase/usecase.dart';
import 'package:cathering_mobile/features/login/domain/entities/login.dart';
import 'package:cathering_mobile/features/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class PostLoginUseCase extends UseCase<Login, LoginParams> {
  final LoginRepository repository;

  PostLoginUseCase({required this.repository});

  @override
  Future<Either<Failure, Login>?> call(LoginParams params) async {
    return await repository.postLogin(params.username, params.password);
  }
  
}

class LoginParams extends Equatable{
  final String username;
  final String password;

  const LoginParams({
    required this.username, 
    required this.password
  });

  @override
  List<Object?> get props => [
    username,
    password
  ];
}