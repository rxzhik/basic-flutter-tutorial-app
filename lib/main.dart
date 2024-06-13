import 'package:flutter/material.dart';
import 'location_detail.dart';

void main() {
  // The runApp function displays whatever you pass to it on the screen.
  // Here MaterialApp is the constructor, if we need to use material widgets
  // we need to warp it in a parent widget called MaterialApp
  return runApp(MaterialApp(
    // Here this is the "/" home route widget., this is the first screen that
    // shows up.
    home: LocationDetail(),
  ));
}
