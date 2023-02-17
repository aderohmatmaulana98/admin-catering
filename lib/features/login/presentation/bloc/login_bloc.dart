import 'package:bloc/bloc.dart';
import 'package:cathering_mobile/core/error/model/error.dart';
import 'package:cathering_mobile/features/login/domain/usecases/post_login_use_case.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required this.useCase}) : super(LoginInitial()) {
    on<PostLoginEvent>(_onPostLoginEvent);
  }

  final PostLoginUseCase useCase;

  Future<void> _onPostLoginEvent(
    PostLoginEvent event,
    Emitter<LoginState> emit
  ) async {
    emit(LoginLoading());
    final result = await useCase(LoginParams(username: event.username, password: event.password));
    result!.fold(
      (l) => emit(LoginFailed(ErrorModel(statusCode: l.statusCode, message: l.messsage))), 
      (r) => emit(LoginSuccess())
    );
  }
}
