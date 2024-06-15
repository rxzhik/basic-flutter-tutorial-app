import 'package:flutter/material.dart';
import 'package:test_drive/mocks/mock_location.dart';
import 'package:test_drive/models/location.dart';
import 'location_detail.dart';
import 'location_list.dart';

void main() {
  // The runApp function displays whatever you pass to it on the screen.
  // Here MaterialApp is the constructor, if we need to use material widgets
  // we need to warp it in a parent widget called MaterialApp
  // final Location mockLocation = MockLocation.fetchAny();
  final List<Location> mockLocations = MockLocation.fetchAll();
  return runApp(MaterialApp(
    // Here this is the "/" home route widget., this is the first screen that
    // shows up
    home: LocationList(mockLocations),
  ));
}
