import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class TextKitTest extends StatefulWidget {
  const TextKitTest({super.key});

  @override
  State<TextKitTest> createState() => _TextKitTestState();
}

class _TextKitTestState extends State<TextKitTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: SizedBox(
              width: 250,
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Horizon',
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('Design first, then code', cursor: '|'),
                    TypewriterAnimatedText('Do not patch bugs out, rewrite them', cursor: '<|>'),
                    TypewriterAnimatedText('Do not test bugs out, design them out', cursor: '💡'),
                  ],
                  onTap: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
