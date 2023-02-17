import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    required this.text, 
    super.key, 
    this.size = 12, 
    this.weight = FontWeight.w400, 
    this.color = Colors.black,
    this.textAlign = TextAlign.start,
    this.isUsedMaxLines = true,
    this.fontFamily = 'Roboto',
    this.textDecoration = TextDecoration.none,
    this.fontStyle = FontStyle.normal,
  });

  final String text;
  final double size;
  final FontWeight weight;
  final Color color;
  final TextAlign textAlign;
  final bool isUsedMaxLines;
  final String fontFamily;
  final TextDecoration textDecoration;
  final FontStyle fontStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: isUsedMaxLines ? 2 : null,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color,
        fontStyle: fontStyle,
        overflow: isUsedMaxLines ? TextOverflow.ellipsis : TextOverflow.visible,
        fontFamily: fontFamily,
        decoration: textDecoration,
      ),
    );
  }
}
