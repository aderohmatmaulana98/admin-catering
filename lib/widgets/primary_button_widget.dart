import 'package:cathering_mobile/themes/colors.dart';
import 'package:cathering_mobile/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryBtnWidget extends StatelessWidget {
  const PrimaryBtnWidget({
    super.key, 
    required this.text, 
    required this.onTap, 
    this.textSize = 18, 
    this.fontWeight = FontWeight.w600, 
    this.width = 1, 
    this.height = 50,
    this.textColor = Colors.black
  });

  final String text;
  final VoidCallback onTap;
  final int textSize;
  final FontWeight fontWeight;
  final int width;
  final int height;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.sw,
      height: height.h,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: kPriamryColor,
        ), 
        child: CustomTextWidget(
          text: text,
          color: textColor,
          size: textSize.sp,
          weight: fontWeight,
        ),
      ),
    );
  }
}
