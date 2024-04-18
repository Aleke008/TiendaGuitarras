// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:carousel_slider/carousel_slider.dart';

class Carouselslider extends StatefulWidget {
  const Carouselslider({
    super.key,
    this.width,
    this.height,
    this.images,
  });

  final double? width;
  final double? height;
  final List<String>? images;

  @override
  State<Carouselslider> createState() => _CarouselsliderState();
}

class _CarouselsliderState extends State<Carouselslider> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: CarouselSlider(
      options: CarouselOptions(height: 400.0),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 247, 202, 217)),
                child: Text(
                  'LA MÚSICA A TU ALCANCE',
                  style: TextStyle(fontSize: 16.0),
                ));
          },
        );
      }).toList(),
    ));
  }
}
