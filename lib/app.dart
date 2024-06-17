import 'package:flutter/material.dart';
import 'package:test_drive/location_list.dart';

class App extends StatelessWidget {
  // Here MaterialApp is the constructor, if we need to use material widgets
  // we need to warp it in a parent widget called MaterialApp
  // final Location mockLocation = MockLocation.fetchAny();

  /// State in flutter similar to useState and state management in react,
  /// it is basicaly data for the widget, it gives us two advantages:
  /// 1. Its a way to save data across rebuilds of a widget.
  /// 2. It gives us a way to notify our widget when data has changed, thus
  ///    triggering a rebuild of the widget.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Here this is the "/" home route widget., this is the first screen that
      // shows up
      home: LocationList(),
    );
  }
}
