import 'package:flutter/material.dart';

class Intrest {
  final String name;
  final String title;
  final String description;
  final Color color;

  Intrest({
    required this.title,
    required this.name,
    required this.description,
    required this.color,
  });
}

class DemoData {
  List<Intrest> _intrests = [
    Intrest(
      name: 'Festivals',
      title: 'Festivals',
      description:
          'This is you if you like going to festivals,\nor just looking at them',
      color: Color(0xffF76849),
    ),
    Intrest(
      name: 'Partying',
      title: 'Partying',
      description:
          'Home parties, school parties, dog partsies,\nany kind of parties',
      color: Color(0xff822FD3),
    ),
    Intrest(
      name: 'Travelling',
      title: 'Travelling',
      description: 'From Madagaskar to Norway you like them all',
      color: Color(0xff2CB47D),
    ),
    Intrest(
      name: 'Sports',
      title: 'Sports',
      description:
          'You like craking some beers with the boys on a Saturday night,\nor with girls',
      color: Color(0xff3184FE),
    ),
  ];

  List<Intrest> getIntrests() => _intrests;
}
