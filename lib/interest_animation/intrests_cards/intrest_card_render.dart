import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../functions/provider.dart';
import 'intrests_data.dart';

class TravelCardRenderer extends StatelessWidget {
  final double offset;
  final double cardWidth;
  final double cardHeight;
  final Intrest intrest;
  final int itemIndex;

  const TravelCardRenderer(this.offset,
      {super.key, this.cardWidth = 250, required this.intrest, required this.cardHeight, required this.itemIndex});

  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return GestureDetector(
      onTap: () {
        if (authProvider.listChosen.contains(itemIndex)) {
          authProvider.removeFromIntChosen(itemIndex);
        } else {
          authProvider.addToIntChosen(itemIndex);
        }
      },
      child: Container(
        width: cardWidth,
        margin: EdgeInsets.only(top: 8),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: <Widget>[
            // Card background color & decoration
            Container(
              margin: EdgeInsets.only(top: 30, left: 12, right: 12, bottom: 12),
              decoration: BoxDecoration(
                color: intrest.color,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 4 * offset.abs()),
                  BoxShadow(color: Colors.black12, blurRadius: 10 + 6 * offset.abs()),
                ],
              ),
            ),
            // City image, out of card by 15px
            Positioned(top: -15, child: _buildCityImage()),
            // City information
            _buildCityData(),
            // Container To show if the card is selected
            authProvider.listChosen.contains(itemIndex)
                ? Positioned(
                    bottom: 0,
                    child: Container(
                      width: 39,
                      height: 39,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.black),
                      child: Icon(
                        Icons.done,
                        color: Colors.green,
                        size: 22,
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _buildCityImage() {
    double maxParallax = 30;
    double globalOffset = offset * maxParallax * 2;
    double cardPadding = 28;
    double containerWidth = cardWidth - cardPadding;
    return Container(
      height: cardHeight,
      width: containerWidth,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          _buildPositionedLayer(
              "images/${intrest.name}/${intrest.name}-Back.png", containerWidth * .8, maxParallax * .1, globalOffset),
          _buildPositionedLayer(
              "images/${intrest.name}/${intrest.name}-Middle.png", containerWidth * .9, maxParallax * .6, globalOffset),
          _buildPositionedLayer(
              "images/${intrest.name}/${intrest.name}-Front.png", containerWidth * .9, maxParallax, globalOffset),
        ],
      ),
    );
  }

  Widget _buildCityData() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // The sized box mock the space of the intrest image
        SizedBox(width: double.infinity, height: cardHeight * .57),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(intrest.title,
              style: GoogleFonts.fredoka(color: Colors.white, fontSize: 35, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(intrest.description,
              style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white),
              textAlign: TextAlign.center),
        ),
        Expanded(
          child: SizedBox(),
        ),
        SizedBox(height: 8)
      ],
    );
  }

  Widget _buildPositionedLayer(String path, double width, double maxOffset, double globalOffset) {
    double cardPadding = 24;
    double layerWidth = cardWidth - cardPadding;
    return Positioned(
        left: ((layerWidth * .5) - (width / 2) - offset * maxOffset) + globalOffset,
        bottom: cardHeight * .45,
        child: Image.asset(
          path,
          width: width,
          // package: App.pkg,
        ));
  }
}
