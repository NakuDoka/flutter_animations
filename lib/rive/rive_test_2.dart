import 'package:animations/rive/widgets/difficultybutton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

class RiveStateTest extends StatefulWidget {
  const RiveStateTest({super.key});

  @override
  State<RiveStateTest> createState() => _RiveStateTestState();
}

class _RiveStateTestState extends State<RiveStateTest> {
  SMINumber? _bump;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool isNumbers = false;

  void _onRiveInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(artboard, 'loop');
    artboard.addController(controller!);
    _bump = controller.findInput<double>('state') as SMINumber;
  }

  void _hitBump(int value) => _bump?.value = value.toDouble();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Text(
              'Choose Mode',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 22),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0, left: 22.0, right: 22.0),
              child: Center(
                  child: SizedBox(
                height: screenHeight / 2.5,
                child: RiveAnimation.asset(
                  'rives/choose_mode.riv',
                  stateMachines: const ['loop'],
                  onInit: _onRiveInit,
                  fit: BoxFit.fitHeight,
                ),
              )),
            ),
            const SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    onTap: () {
                      _hitBump(2);
                      setState(() {
                        isNumbers = true;
                      });
                    },
                    child: DifficultyButton(isSelected: isNumbers, text: 'NUMBERS')),
                InkWell(
                    onTap: () {
                      _hitBump(1);
                      setState(() {
                        isNumbers = false;
                      });
                    },
                    child: DifficultyButton(isSelected: !isNumbers, text: 'IMAGES')),
              ],
            ),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
