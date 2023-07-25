import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';

class AutoAnimatedTest extends StatefulWidget {
  const AutoAnimatedTest({super.key});

  @override
  State<AutoAnimatedTest> createState() => _AutoAnimatedTestState();
}

class _AutoAnimatedTestState extends State<AutoAnimatedTest> {
  final options = LiveOptions(
    // Start animation after (default zero)
    delay: Duration(milliseconds: 100),

    // Show each item through (default 250)
    showItemInterval: Duration(milliseconds: 200),

    // Animation duration (default 250)
    showItemDuration: Duration(milliseconds: 200),

    // Animations starts at 0.05 visible
    // item fraction in sight (default 0.025)
    visibleFraction: 0.025,

    // Repeat the animation of the appearance
    // when scrolling in the opposite direction (default false)
    // To get the effect as in a showcase for ListView, set true
    reAnimateOnVisibility: false,
  );

// Build animated item (helper for all examples)
  Widget buildAnimatedItem(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) =>
      // For example wrap with fade transition
      FadeTransition(
        opacity: Tween<double>(
          begin: 0,
          end: 1,
        ).animate(animation),
        // And slide transition
        child: SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, -0.1),
            end: Offset.zero,
          ).animate(animation),
          // Paste you Widget
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Container(
                color: Colors.white,
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Text(
                    index.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                ))),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: LiveList.options(
            options: options,

            // Like GridView.builder, but also includes animation property
            itemBuilder: buildAnimatedItem,

            // Other properties correspond to the `ListView.builder` / `ListView.separated` widget
            itemCount: 30,
          ),
        ),
      ),
    );
  }
}
