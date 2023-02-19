import 'package:cathering_mobile/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:cathering_mobile/features/home/presentation/views/home_view.dart';
import 'package:cathering_mobile/features/login/presentation/view/login_view.dart';
import 'package:cathering_mobile/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>()..authenticated(),
      child: const AuthPage(),
    );
  }
}

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthAuthenticated) {
          return const HomeView();
        } else {
          return const LoginView();
        }
      },
    );
  }
}