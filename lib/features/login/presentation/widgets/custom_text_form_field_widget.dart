import 'package:cathering_mobile/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormWidget extends StatelessWidget {
  const CustomTextFormWidget({
    super.key, 
    required this.controller, 
    required this.hintText,
    this.textInputType = TextInputType.text,
    this.isObscure = false,
    this.isPassword = false,
    this.onSuffixIconTap
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  final bool isObscure;
  final bool isPassword;
  final VoidCallback? onSuffixIconTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: kPriamryColor,
      keyboardType: textInputType,
      obscureText: isObscure,
      decoration: InputDecoration(
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: kBlackColor,
        ),
        filled: true,
        suffixIcon: isPassword ? 
        GestureDetector(
          onTap: isPassword ? onSuffixIconTap : null,
          child: Icon(
            isObscure ? 
            Icons.visibility_off : 
            Icons.visibility, color: kBlackColor,
          ),
        ) :
        const SizedBox.shrink(),
        focusColor: kPriamryColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(
            color: kPriamryColor,
          ),
        ),
      ),
    );
  }
}
