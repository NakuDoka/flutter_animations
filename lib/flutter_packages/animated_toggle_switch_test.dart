import 'dart:math';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';

class AnimatedToggleSwitchTest extends StatefulWidget {
  const AnimatedToggleSwitchTest({super.key});

  @override
  State<AnimatedToggleSwitchTest> createState() => _AnimatedToggleSwitchTestState();
}

class _AnimatedToggleSwitchTestState extends State<AnimatedToggleSwitchTest> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Animated Toggle Switch',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          AnimatedToggleSwitch<int>.rolling(
            current: value,
            values: [0, 1, 2, 3],
            onChanged: (i) async {
              setState(() => value = i);
              await Future.delayed(Duration(seconds: 3));
            },
            loading: false, // for deactivating loading animation
            iconBuilder: rollingIconBuilder,
          ),
          AnimatedToggleSwitch<int>.size(
            current: value,
            values: [0, 1, 2, 3],
            iconOpacity: 0.2,
            indicatorSize: Size.fromWidth(100),
            iconBuilder: (value, size) {
              IconData data = Icons.access_time_rounded;
              if (value.isEven) data = Icons.cancel;
              return Icon(data, size: min(size.width, size.height));
            },
            borderColor: value.isEven ? Colors.blue : Colors.red,
            colorBuilder: (i) => i.isEven ? Colors.amber : Colors.red,
            onChanged: (i) => setState(() => value = i),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  if (value < 3) {
                    value++;
                  } else {
                    value = 0;
                  }
                });
              },
              child: Text('Change'))
        ],
      )),
    );
  }

  Widget iconBuilder(int value, Size iconSize) {
    return rollingIconBuilder(value, iconSize, false);
  }

  Widget rollingIconBuilder(int? value, Size iconSize, bool foreground) {
    IconData data = Icons.access_time_rounded;
    if (value?.isEven ?? false) data = Icons.cancel;
    return Icon(
      data,
      size: iconSize.shortestSide,
    );
  }

  Widget sizeIconBuilder(BuildContext context, SizeProperties<int> local, GlobalToggleProperties<int> global) {
    return iconBuilder(local.value, local.iconSize);
  }

  Widget alternativeIconBuilder(BuildContext context, SizeProperties<int> local, GlobalToggleProperties<int> global) {
    IconData data = Icons.access_time_rounded;
    switch (local.value) {
      case 0:
        data = Icons.ac_unit_outlined;
        break;
      case 1:
        data = Icons.account_circle_outlined;
        break;
      case 2:
        data = Icons.assistant_navigation;
        break;
      case 3:
        data = Icons.arrow_drop_down_circle_outlined;
        break;
    }
    return Icon(
      data,
      size: local.iconSize.shortestSide,
    );
  }
}
