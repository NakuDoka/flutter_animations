import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DifficultyButton extends StatefulWidget {
  const DifficultyButton({super.key, required this.isSelected, required this.text});
  final bool isSelected;
  final String text;
  @override
  State<DifficultyButton> createState() => _DifficultyButtonState();
}

class _DifficultyButtonState extends State<DifficultyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115,
      height: 30,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.pinkAccent,
            offset: Offset(2, 2),
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
        color: widget.isSelected ? Colors.pink : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: widget.isSelected ? Colors.pink : Colors.white, width: widget.isSelected ? 0 : 2),
      ),
      child: Center(
        child: Text(
          widget.text,
          style: GoogleFonts.poppins(
            color: widget.isSelected ? Colors.white : Colors.pink,
          ),
        ),
      ),
    );
    ;
  }
}
