import 'package:bloc/bloc.dart';
import 'package:cathering_mobile/core/error/model/error.dart';
import 'package:cathering_mobile/core/usecase/usecase.dart';
import 'package:cathering_mobile/features/beranda/data/models/paket_model.dart';
import 'package:cathering_mobile/features/beranda/domain/entities/paket.dart';
import 'package:cathering_mobile/features/beranda/domain/usecases/get_paket_use_cases.dart';
import 'package:equatable/equatable.dart';

part 'paket_event.dart';
part 'paket_state.dart';

class PaketBloc extends Bloc<PaketEvent, PaketState> {
  PaketBloc(this.useCases) : super(PaketInitial()) {
    on<GetPaketEvent>(_onGetPaketEvent);
  }

  final GetPaketUseCases useCases;

  Future<void> _onGetPaketEvent(
    GetPaketEvent event,
    Emitter<PaketState> emit,
  ) async {
    emit(PaketLoading());
    final result = await useCases(NoParams());
    result!.fold(
      (l) => emit(PaketFailed(ErrorModel(message: l.messsage))), 
      (r) {
        r.insert(0, PaketModel(id: 0, namaPaket: 'All', harga: 123, createdAt: DateTime.now(), updatedAt: DateTime.now(), isActive: true));
        emit(PaketLoaded(r));
      }
    );
  }
}
