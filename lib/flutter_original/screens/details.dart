import 'package:flutter/material.dart';

import '../components/heart.dart';
import '../models/Trip.dart';

class Details extends StatelessWidget {
  final Trip trip;
  const Details({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
                child: Hero(
              tag: 'location-img-${trip.img}',
              child: Image.asset(
                'images/${trip.img}',
                height: 360,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            )),
            const SizedBox(height: 30),
            ListTile(
                title: Text(trip.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey[800])),
                subtitle: Text('${trip.nights} night stay for only \$${trip.price}',
                    style: const TextStyle(letterSpacing: 1)),
                trailing: const Heart()),
            Padding(
                padding: const EdgeInsets.all(18),
                child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim blandit volutpat maecenas volutpat blandit. Elementum pulvinar etiam non quam. In ornare quam viverra orci sagittis. Sit amet nisl purus in mollis. Molestie a iaculis at erat. Pellentesque nec nam aliquam sem et tortor. Neque sodales ut etiam sit amet nisl. Pulvinar sapien et ligula ullamcorper. Nunc eget lorem dolor sed viverra ipsum nunc. Mi bibendum neque egestas congue quisque egestas diam in. Justo eget magna fermentum iaculis eu. Sit amet nisl purus in mollis nunc.",
                    style: TextStyle(color: Colors.grey[600], height: 1.4))),
          ],
        ));
  }
}
