import 'package:cathering_mobile/features/register/domain/entities/gender.dart';
import 'package:cathering_mobile/themes/colors.dart';
import 'package:cathering_mobile/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RadioAndTextRowWidget extends StatelessWidget {
  const RadioAndTextRowWidget({
    super.key, 
    required this.groupValue, 
    required this.value, 
    required this.onChanged, 
  });

  final String? groupValue;
  final String value;
  final Function(dynamic) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: value, 
          groupValue: groupValue,
          
          fillColor: MaterialStateColor.resolveWith(
            (states) => kPriamryColor,
          ),
          onChanged: onChanged,
        ),
        SizedBox(width: 4.w,),
        CustomTextWidget(
          text: value,
          color: Colors.white,
          size: 18.sp,
          weight: FontWeight.w500,
        )
      ],
    );
  }
}
