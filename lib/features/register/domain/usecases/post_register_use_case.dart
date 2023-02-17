import 'package:cathering_mobile/core/error/failures.dart';
import 'package:cathering_mobile/core/usecase/usecase.dart';
import 'package:cathering_mobile/features/register/domain/repositories/register_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class PostRegisterUseCase extends UseCase<void, RegisterParams> {
  final RegisterRepository repository;

  PostRegisterUseCase({required this.repository});

  @override
  Future<Either<Failure, void>?> call(RegisterParams params) async {
    return await repository.postRegister(
      userame: params.userame,
      password: params.password, 
      name: params.name, 
      phone: params.phone, 
      address: params.address, 
      email: params.email, 
      gender: params.gender
    );
  }
  
}

class RegisterParams extends Equatable{
  final String userame;
  final String password;
  final String name;
  final String phone;
  final String address;
  final String email;
  final String gender;

  const RegisterParams({
    required this.userame, 
    required this.password, 
    required this.name, 
    required this.phone, 
    required this.address, 
    required this.email, 
    required this.gender
  });

  @override
  List<Object?> get props => [
    userame,
    password,
    name,
    address,
    phone,
    email,
    gender
  ];
}