import 'package:flutter/material.dart';

class BorderPictureCard extends StatelessWidget {
  const BorderPictureCard({super.key, required this.imageLink});
  final String imageLink;

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        height: h * 0.3,
        width: w * 0.6,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imageLink), fit: BoxFit.cover),
            border: Border.all(width: 1.5, color: Colors.amber),
            borderRadius: BorderRadius.circular(200),
            color: Colors.transparent),
      ),
    );
  }
}
