import 'package:cathering_mobile/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    required this.text, 
    super.key, 
    this.size = 12, 
    this.weight = FontWeight.w400, 
    this.color = kTextColor,
    this.textAlign = TextAlign.start,
    this.isUsedMaxLines = true,
    this.textDecoration = TextDecoration.none,
    this.fontStyle = FontStyle.normal,
  });

  final String text;
  final double size;
  final FontWeight weight;
  final Color color;
  final TextAlign textAlign;
  final bool isUsedMaxLines;
  final TextDecoration textDecoration;
  final FontStyle fontStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: isUsedMaxLines ? 2 : null,
      textAlign: textAlign,
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(
          overflow: isUsedMaxLines ? TextOverflow.ellipsis : TextOverflow.visible,
        ),
        fontSize: size,
        fontWeight: weight,
        color: color,
        fontStyle: fontStyle,
        decoration: textDecoration,
      )
    );
  }
}
