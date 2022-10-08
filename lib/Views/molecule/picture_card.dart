import 'package:flutter/material.dart';

class PictureCard extends StatelessWidget {
  const PictureCard({super.key, required this.imageUrl, required this.herotag});
  final String imageUrl;
  final String herotag;
  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return Hero(
      tag: herotag,
      child: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
        backgroundColor: Colors.white,
        radius: 100,
      ),
    );
  }
}
