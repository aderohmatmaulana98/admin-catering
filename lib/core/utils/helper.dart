// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;

// import '';

// Future getPdf(Widget page) async {
//   pw.Document pdf = pw.Document();
//   pdf.addPage(
//     pw.Page(
//       pageFormat: PdfPageFormat.a4,
//       build: (context) {
//         return pw.Expanded(
//           child: 
//         );
//       },
//     ),
//   );
//   File pdfFile = File('Your path + File name');
//   pdfFile.writeAsBytesSync(pdf.save());
// }