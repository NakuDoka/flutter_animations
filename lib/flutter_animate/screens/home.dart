import 'package:flutter/material.dart';

import '../components/screenTitle.dart';
import '../components/tripList.dart';

class HomePackage extends StatefulWidget {
  const HomePackage({super.key});

  @override
  State<HomePackage> createState() => _HomePackageState();
}

class _HomePackageState extends State<HomePackage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/bg.png"), fit: BoxFit.fitWidth, alignment: Alignment.topLeft),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 30),
                SizedBox(
                  height: 160,
                  child: ScreenTitle(text: 'Flutter Built-in Animations'),
                ),
                Flexible(
                  child: TripList(),
                )
              ],
            )));
  }
}
