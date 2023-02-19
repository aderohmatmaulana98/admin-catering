
import 'package:cathering_mobile/themes/colors.dart';
import 'package:cathering_mobile/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaketContainerWidget extends StatelessWidget {
  const PaketContainerWidget({
    super.key, required this.namaPaket, required this.isActive,
  });

  final String namaPaket;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100.r),
        border: Border.all(
          color: isActive ? Colors.white : kGreyColor.withOpacity(.25)
        ),
        boxShadow: isActive ? [
          BoxShadow(
            offset: const Offset(5, 10),
            blurRadius: 8,
            color: kPrimaryColor.withOpacity(.1)
          )
        ] : []
      ),
      child: CustomTextWidget(
        text: namaPaket == 'All' ? namaPaket : 'paket $namaPaket',
        weight: FontWeight.w500,
        color: isActive ? kPrimaryColor : kGreyColor,
      ),
    );
  }
}