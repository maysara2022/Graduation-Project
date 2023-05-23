import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension ContextExtension on BuildContext {
  void shwoMassege({required String message, bool error = false}) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(
        message,
        style: GoogleFonts.cairo(),
      ),

      backgroundColor: error ? Colors.red : Colors.green,
      duration: Duration(seconds: 4),
      dismissDirection: DismissDirection.horizontal,
      // behavior: SnackBarBehavior.floating,
    ));
  }
}
