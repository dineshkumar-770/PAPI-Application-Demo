import 'package:flutter/material.dart';

class CoverImageInProfile extends StatelessWidget {
  const CoverImageInProfile(
      {super.key, required this.image, required this.height});

  final String image;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
          color: Colors.transparent,
          borderRadius:
              const BorderRadius.only(bottomLeft: Radius.circular(60))),
    );
  }
}
