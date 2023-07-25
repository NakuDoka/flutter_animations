import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ScreenTitle extends StatelessWidget {
  final String text;

  const ScreenTitle({super.key, required this.text});

  @override
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold),
    )
        .animate()
        .fadeIn(duration: Duration(milliseconds: 500), curve: Curves.easeIn)
        .slideY(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }
}
