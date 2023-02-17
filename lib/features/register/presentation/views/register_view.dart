import 'package:cathering_mobile/features/login/presentation/view/login_view.dart';
import 'package:cathering_mobile/features/login/presentation/widgets/custom_text_form_field_widget.dart';
import 'package:cathering_mobile/features/register/domain/entities/gender.dart';
import 'package:cathering_mobile/features/register/presentation/bloc/register_bloc.dart';
import 'package:cathering_mobile/features/register/presentation/widgets/radio_and_text_row_widget.dart';
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

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RegisterBloc>(),
      child: const RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _usernameEditingController;
  late TextEditingController _passwordEditingController;
  late TextEditingController _nameEditingController;
  late TextEditingController _alamatditingController;
  late TextEditingController _phoneEditingController;
  late TextEditingController _emailEditingController;

  final _gender = <Gender>[
    Gender(
      value: 'Pria',
      isActive: false,
    ),
    Gender(
      value: 'Wanita',
      isActive: false,
    ),
  ];

  String? _groupValue;
  final _formKey = GlobalKey<FormState>();
  bool isObscure = true;

  @override
  void initState() {
    _usernameEditingController = TextEditingController();
    _passwordEditingController = TextEditingController();
    _nameEditingController = TextEditingController();
    _alamatditingController = TextEditingController();
    _phoneEditingController = TextEditingController();
    _emailEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _usernameEditingController.dispose();
    _passwordEditingController.dispose();
    _nameEditingController.dispose();
    _alamatditingController.dispose();
    _phoneEditingController.dispose();
    _emailEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: kBlackColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50.h),
                  Image.asset(
                    'assets/images/logo.png',
                    width: 256.r,
                    height: 256.r,
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
                    height: 12.h,
                  ),
                  nameTextFormWidget(),
                  SizedBox(
                    height: 12.h,
                  ),
                  phoneTextFormWidget(),
                  SizedBox(
                    height: 12.h,
                  ),
                  addressTextFormWidget(),
                  SizedBox(
                    height: 12.h,
                  ),
                  emailTextFormWidget(),
                  SizedBox(
                    height: 12.h,
                  ),
                  genderRowWidget(),
                  SizedBox(
                    height: 32.h,
                  ),
                  registerBtnBlocListenerWidget(),
                  SizedBox(
                    height: 32.h,
                  ),
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
    );
  }

  BlocListener<RegisterBloc, RegisterState> registerBtnBlocListenerWidget() {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if(state is RegisterSuccess){
          Navigator.pushReplacement(
            context, 
            MaterialPageRoute(builder: (_) => const LoginView())
          );
        } else if (state is RegisterFiled){
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
      child: registerBtnWidget(),
    );
  }

  Row genderRowWidget() {
    return Row(
      children: [
        RadioAndTextRowWidget(
          groupValue: _groupValue,
          value: _gender[0].value,
          onChanged: (value) {
            setState(() {
              _groupValue = _gender[0].value;
            });
          },
        ),
        SizedBox(
          width: 32.w,
        ),
        RadioAndTextRowWidget(
          groupValue: _groupValue,
          value: _gender[1].value,
          onChanged: (value) {
            setState(() {
              _groupValue = _gender[1].value;
            });
          },
        )
      ],
    );
  }

  Center registerText() {
    return Center(
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: 14.sp,
          ),
          children: [
            TextSpan(
              text: 'Sudah punya akun? ',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
            ),
            TextSpan(
              text: 'Masuk',
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
                        builder: (_) => const LoginView(),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  PrimaryBtnWidget registerBtnWidget() {
    return PrimaryBtnWidget(
      onTap: () {
        if(_formKey.currentState!.validate()){
          context.read<RegisterBloc>().add(PostRegisterEvent(
            userame: _usernameEditingController.text, 
            password: _passwordEditingController.text, 
            name: _nameEditingController.text, 
            phone: _phoneEditingController.text, 
            address: _alamatditingController.text, 
            email: _emailEditingController.text, 
            gender: _groupValue!
          ));
        }
      },
      text: 'Daftar',
    );
  }

  CustomTextFormWidget emailTextFormWidget() {
    return CustomTextFormWidget(
      controller: _emailEditingController,
      hintText: 'Email',
    );
  }

  CustomTextFormWidget phoneTextFormWidget() {
    return CustomTextFormWidget(
      controller: _phoneEditingController,
      hintText: 'No Handphone',
    );
  }

  CustomTextFormWidget addressTextFormWidget() {
    return CustomTextFormWidget(
      controller: _alamatditingController,
      hintText: 'Alamat',
    );
  }

  CustomTextFormWidget nameTextFormWidget() {
    return CustomTextFormWidget(
      controller: _nameEditingController,
      hintText: 'Nama lengkap',
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
