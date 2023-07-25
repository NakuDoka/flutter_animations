import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonOne extends StatelessWidget {
  const ButtonOne({super.key, required this.buttonText, required this.buttonColor, required this.textColor});
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth / 1.1,
      height: screenHeight / 19.5 + 10,
      decoration: BoxDecoration(color: buttonColor, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          buttonText,
          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: textColor),
        ),
      ),
    );
  }
}
