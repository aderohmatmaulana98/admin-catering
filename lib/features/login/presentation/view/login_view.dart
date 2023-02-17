import 'package:cathering_mobile/features/home/presentation/views/home_view.dart';
import 'package:cathering_mobile/features/login/presentation/bloc/login_bloc.dart';
import 'package:cathering_mobile/features/login/presentation/widgets/custom_text_form_field_widget.dart';
import 'package:cathering_mobile/features/register/presentation/views/register_view.dart';
import 'package:cathering_mobile/injection_container.dart';
import 'package:cathering_mobile/themes/colors.dart';
import 'package:cathering_mobile/widgets/custom_dialog_widget.dart';
import 'package:cathering_mobile/widgets/custom_text_widget.dart';
import 'package:cathering_mobile/widgets/primary_button_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginBloc>(),
      child: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _usernameEditingController;
  late TextEditingController _passwordEditingController;
  bool isObscure = true;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _usernameEditingController = TextEditingController();
    _passwordEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _usernameEditingController.dispose();
    _passwordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: kBlackColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SizedBox(
              width: 1.sw,
              height: 1.sh,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    Image.asset(
                      'assets/images/logo.png',
                      width: 256.r,
                      height: 256.r,
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    titleTextWidget(),
                    SizedBox(
                      height: 8.h,
                    ),
                    subtitleTextWidget(),
                    SizedBox(
                      height: 24.h,
                    ),
                    usernameTextFormFieldWidget(),
                    SizedBox(
                      height: 12.h,
                    ),
                    passwordTextFormWidget(),
                    SizedBox(
                      height: 32.h,
                    ),
                    signInBtnBlocListener(),
                    const Spacer(),
                    registerText(),
                    SizedBox(
                      height: 32.h,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  BlocListener<LoginBloc, LoginState> signInBtnBlocListener() {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if(state is LoginSuccess){
          Navigator.pushReplacement(
            context, 
            MaterialPageRoute(builder: (_) => const HomeView())
          );
        } else if (state is LoginFailed){
          showDialog(
            context: context, 
            builder: (_) => ErrorDialog(
              message: state.error.message,
              statusCode: state.error.statusCode.toString(),
            ),
          );
        } else {
          showDialog(
            context: context, 
            builder: (_)=> const LoadingDialog()
          );
        }
      },
      child: loginBtnWidget(),
    );
  }

  Widget registerText() {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 14.sp,
        ),
        children: [
          TextSpan(
            text: 'Belum punya akun? ',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),
          ),
          TextSpan(
            text: 'Daftar',
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
              fontSize: 13.sp,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<void>(
                      builder: (_) => const RegisterView(),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  PrimaryBtnWidget loginBtnWidget() {
    return PrimaryBtnWidget(
      onTap: () {
        if(_formKey.currentState!.validate()){
          context.read<LoginBloc>().add(
            PostLoginEvent(
              username: _usernameEditingController.text, 
              password: _passwordEditingController.text
            )
          );
        }
      },
      text: 'Masuk',
    );
  }

  CustomTextFormWidget passwordTextFormWidget() {
    return CustomTextFormWidget(
      controller: _passwordEditingController,
      isPassword: true,
      isObscure: isObscure,
      onSuffixIconTap: () {
        setState(() {
          isObscure = !isObscure;
        });
      },
      hintText: 'Password',
    );
  }

  CustomTextFormWidget usernameTextFormFieldWidget() {
    return CustomTextFormWidget(
      controller: _usernameEditingController,
      hintText: 'Username',
    );
  }

  CustomTextWidget subtitleTextWidget() {
    return CustomTextWidget(
      text: 'Pengalaman membeli makanan dengan cepat',
      size: 14.sp,
      weight: FontWeight.w500,
      color: Colors.white,
    );
  }

  CustomTextWidget titleTextWidget() {
    return CustomTextWidget(
      text: 'Catering Mobile',
      size: 24.sp,
      weight: FontWeight.w600,
      color: Colors.white,
    );
  }
}
