import 'package:cathering_mobile/core/error/exception.dart';
import 'package:cathering_mobile/core/error/failures.dart';
import 'package:cathering_mobile/core/platform/network_info.dart';
import 'package:cathering_mobile/features/register/data/datasources/register_remote_data_source.dart';
import 'package:cathering_mobile/features/register/domain/repositories/register_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final NetworkInfo networkInfo;
  final RegisterRemoteDataSource remoteDataSource;

  RegisterRepositoryImpl({
    required this.networkInfo, 
    required this.remoteDataSource
  });

  @override
  Future<Either<Failure, void>>? postRegister({required String userame, required String password, required String name, required String phone, required String address, required String email, required String gender}) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.postRegister(userame: userame, password: password, name: name, phone: phone, address: address, email: email, gender: gender);
        return const Right('Success');
      } on ServerException catch (e) {
        return Left(ServerFailure(e.error.message, e.error.statusCode));
      }
    } else {
      return const Left(ServerFailure(
        'Please check your internet connection',
        404
      ));
    }
  }
  
}