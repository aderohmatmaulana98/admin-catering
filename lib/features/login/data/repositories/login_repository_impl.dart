import 'package:cathering_mobile/core/error/exception.dart';
import 'package:cathering_mobile/core/platform/network_info.dart';
import 'package:cathering_mobile/features/login/data/datasources/login_local_data_source.dart';
import 'package:cathering_mobile/features/login/data/datasources/login_remote_data_source.dart';
import 'package:cathering_mobile/features/login/domain/entities/login.dart';
import 'package:cathering_mobile/core/error/failures.dart';
import 'package:cathering_mobile/features/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

class LoginRepositoryImpl implements LoginRepository {
  final NetworkInfo networkInfo;
  final LoginRemoteDataSource remoteDataSource;
  final LoginLocalDataSource localDataSource;

  LoginRepositoryImpl({
    required this.networkInfo, 
    required this.remoteDataSource, 
    required this.localDataSource
  });

  @override
  Future<Either<Failure, Login>>? postLogin(String username, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.postLogin(username, password);
        localDataSource.cachedLoginData(response!);
        return Right(response);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.error.message, e.error.statusCode!));
      }
    } else {
      return const Left(ServerFailure(
        'Pleasae check your internet connection',
        404
      ));
    }
  }
  
}