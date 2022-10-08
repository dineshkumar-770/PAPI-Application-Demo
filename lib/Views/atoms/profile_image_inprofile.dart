import 'package:flutter/material.dart';

class ProfileImageInProfile extends StatelessWidget {
  const ProfileImageInProfile({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: 175,
      decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(120),
          border: Border.all(width: 5, color: Colors.amber)),
    );
  }
}
