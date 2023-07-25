import 'package:animations/functions/provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'buttonOne.dart';
import 'intrest_card_list.dart';
import 'intrests_data.dart';

class ChooseIntrests extends StatefulWidget {
  const ChooseIntrests({super.key});

  @override
  State<ChooseIntrests> createState() => _ChooseIntrestsState();
}

class _ChooseIntrestsState extends State<ChooseIntrests> {
  late List<Intrest> _intrestsList;
  Intrest? _currentIntrest;

  @override
  void initState() {
    super.initState();
    var data = DemoData();
    _intrestsList = data.getIntrests();
    _currentIntrest = _intrestsList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(31, 33, 35, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  Text(
                    'What are your interest?',
                    style: GoogleFonts.poppins(fontSize: 26, fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                  Text(
                    'You can choose mulitple',
                    style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
                  )
                ],
              ),
              IntrestCardList(
                intrests: _intrestsList,
                onInterestChange: _handleIntrestChange,
              ),
              const SizedBox(),
              InkWell(
                onTap: () {},
                child: ButtonOne(
                  buttonText: 'Continue',
                  buttonColor: Colors.blue,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleIntrestChange(Intrest intrest) {
    setState(() {
      this._currentIntrest = intrest;
    });
  }
}
