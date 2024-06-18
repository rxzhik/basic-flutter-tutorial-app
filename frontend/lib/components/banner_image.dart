import 'package:flutter/material.dart';

class BannerImage extends StatelessWidget {
  final String url;
  final double height;

  BannerImage({required this.url, required this.height});

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) {
      return Container();
    }

    // Image? image;
    // try {
    //   image = Image.network(url, fit: BoxFit.cover);
    // } catch (e) {
    //   print("Could not load image ${url}");
    // }
    // return Container(
    //   constraints: BoxConstraints.expand(height: height),
    //   child: image,
    // );

    try {
      return Container(
        constraints: BoxConstraints.expand(height: height),
        child: Image.network(url, fit: BoxFit.cover),
      );
    } catch (e) {
      print("could not load image $url");
      return Container();
    }
  }
}
