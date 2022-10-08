import 'package:flutter/material.dart';
import 'package:riverpod_understanding/Views/atoms/border_pic_avatar.dart';

class ProfileMain extends StatelessWidget {
  const ProfileMain(
      {super.key,
      required this.profilepic,
      required this.coverpic,
      required this.child});

  final String profilepic;
  final String coverpic;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        height: h * 0.6,
        width: w,
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Column(
          children: [
            Container(
              height: h * 0.42,
              width: w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(coverpic), fit: BoxFit.cover),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  BorderPictureCard(imageLink: profilepic),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: child,
              ),
            )
          ],
        ),
      ),
    );
  }
}
