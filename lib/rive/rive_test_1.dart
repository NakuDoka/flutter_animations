import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

class RiveAnimationTest extends StatefulWidget {
  const RiveAnimationTest({super.key});

  @override
  State<RiveAnimationTest> createState() => _RiveAnimationTestState();
}

class _RiveAnimationTestState extends State<RiveAnimationTest> {
  /// Controller for playback
  late RiveAnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = OneShotAnimation(
      'walk',
      autoplay: true,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(),
            Padding(
              padding: const EdgeInsets.only(top: 0.0, bottom: 20, left: 22.0, right: 22.0),
              child: Center(
                  child: SizedBox(
                height: screenHeight / 2.5,
                child: RiveAnimation.asset(
                  'rives/load.riv',
                  controllers: [_controller],
                  fit: BoxFit.fitHeight,
                ),
              )),
            ),
            Text(
              'Logging in...',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 22),
            ),
            const SizedBox()
          ],
        ),
      ),
    );
  }
}
