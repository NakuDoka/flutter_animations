import 'package:animations/flutter_animate/screens/home.dart';
import 'package:animations/flutter_original/screens/home.dart';
import 'package:animations/flutter_packages/animated_flip_counter_test.dart';
import 'package:animations/flutter_packages/auto_animated.dart';
import 'package:animations/interest_animation/intrests_cards/test_cards.dart';
import 'package:animations/functions/provider.dart';
import 'package:animations/rive/rive_test_1.dart';
import 'package:animations/rive/rive_test_2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'flutter_packages/animated_toggle_switch_test.dart';
import 'flutter_packages/text_kit_test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>.value(value: AuthProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: ChooseIntrests(),
      ),
    );
  }
}
