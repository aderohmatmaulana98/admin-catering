import 'package:cathering_mobile/core/error/failures.dart';
import 'package:cathering_mobile/features/beranda/domain/entities/paket.dart';
import 'package:dartz/dartz.dart';

abstract class PaketRepository {
  Future<Either<Failure, List<Paket>>>? getPaket();
}