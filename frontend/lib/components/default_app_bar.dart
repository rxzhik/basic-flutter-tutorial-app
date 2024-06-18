import 'package:flutter/material.dart';
import 'package:test_drive/styles.dart';

// So here we aren't building the nav bar using a stateless widget, rather
// we just extend the AppBar widget, so that we can just override some of its
// attributes and not build it from scratch.
class DefaultAppBar extends AppBar {
  @override
  final Widget title =
      Text("Tourisom & Co.".toUpperCase(), style: Styles.navBarTitle);
  @override
  final Color backgroundColor = Colors.white;

  @override
  final bool centerTitle = true;

  @override
  final double elevation = 0.5;

  @override
  final IconThemeData iconTheme = IconThemeData(color: Colors.black);
}
