import 'package:bloc/bloc.dart';
import 'package:cathering_mobile/core/error/model/error.dart';
import 'package:cathering_mobile/features/register/domain/usecases/post_register_use_case.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({required this.useCase}) : super(RegisterInitial()) {
    on<PostRegisterEvent>(_onPostRegisterEvent);
  }

  final PostRegisterUseCase useCase;

  Future<void> _onPostRegisterEvent(
    PostRegisterEvent event,
    Emitter<RegisterState> emit,
  ) async {
    emit(RegisterLoading());
    final result = await useCase(RegisterParams(userame: event.userame, password: event.password, name: event.name, phone: event.phone, address: event.address, email: event.email, gender: event.gender));
    result!.fold(
      (l) => emit(RegisterFiled(ErrorModel(message: l.messsage))), 
      (r) => emit(RegisterSuccess())
    );
  }
}
