import 'package:cathering_mobile/core/error/failures.dart';
import 'package:cathering_mobile/core/usecase/usecase.dart';
import 'package:cathering_mobile/features/beranda/domain/entities/paket.dart';
import 'package:cathering_mobile/features/beranda/domain/repositories/paket_repository.dart';
import 'package:dartz/dartz.dart';

class GetPaketUseCases extends UseCase<List<Paket>, NoParams> {
  final PaketRepository repository;

  GetPaketUseCases({required this.repository});

  @override
  Future<Either<Failure, List<Paket>>?> call(NoParams params) async {
    return await repository.getPaket();
  }
  
}