import 'package:bloc/bloc.dart';
import 'package:cathering_mobile/core/utils/config.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.preferences}) : super(AuthInitial());

  final SharedPreferences preferences;

  void authenticated() {
    final prefs = preferences.containsKey(LOGIN_DATA_KEY);
    if (prefs) {
      return emit(AuthAuthenticated());
    } else {
      return emit(AuthUnAuthenticated());
    }
  }
}
