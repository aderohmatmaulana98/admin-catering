import 'package:cathering_mobile/core/error/exception.dart';
import 'package:cathering_mobile/core/platform/network_info.dart';
import 'package:cathering_mobile/features/beranda/data/datasources/paket_local_data_source.dart';
import 'package:cathering_mobile/features/beranda/data/datasources/paket_remote_data_sources.dart';
import 'package:cathering_mobile/features/beranda/domain/entities/paket.dart';
import 'package:cathering_mobile/core/error/failures.dart';
import 'package:cathering_mobile/features/beranda/domain/repositories/paket_repository.dart';
import 'package:dartz/dartz.dart';

class PaketRepositoryImpl implements PaketRepository {
  final PaketRemoteDataSource remoteDataSource;
  final PaketLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PaketRepositoryImpl({
    required this.remoteDataSource, 
    required this.localDataSource, 
    required this.networkInfo
  });

  @override
  Future<Either<Failure, List<Paket>>>? getPaket() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getPaket();
        localDataSource.cachedPaket(response);
        return Right(response);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.error.message));
      }
    } else {
      try {
        final jsonString = await localDataSource.getCachedPaket();
        return Right(jsonString!);
      } on CacheException catch (e) {
        return Left(CacheFailure(e.message));
      }
    }
  }
}