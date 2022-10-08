import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class Imagepreview extends StatelessWidget {
  const Imagepreview({super.key, required this.imageLink, required this.index});
  final String imageLink;
  final String index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,),
        body: SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: PhotoView(
          maxScale: PhotoViewComputedScale.covered,
          minScale: PhotoViewComputedScale.contained,
          heroAttributes: PhotoViewHeroAttributes(tag: index),
          enableRotation: false,
          imageProvider: NetworkImage(imageLink)),
    ),
    );
  }
}
