import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_understanding/Views/atoms/profile_image_inprofile.dart';
import 'package:riverpod_understanding/Views/atoms/title_name_inprofile.dart';
import 'package:riverpod_understanding/Views/molecule/cover_image_inprofile.dart';
import 'package:riverpod_understanding/Views/molecule/customButtom.dart';
import 'package:riverpod_understanding/Views/molecule/custom_icon_button.dart';
import 'package:riverpod_understanding/provider/providers.dart';

class InPageProfileScreen extends StatelessWidget {
  const InPageProfileScreen(
      {super.key,
      required this.name,
      required this.coverImage,
      required this.profilepic});

  final String name;
  final String profilepic;
  final String coverImage;

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return Center(
      child: Consumer(builder: (context, ref, _) {
        bool isLiked = ref.watch(likeProvider);
        return Container(
          height: h * 0.62,
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.black),
          child: Stack(children: [
            Positioned(
                child:
                    CoverImageInProfile(image: coverImage, height: h * 0.275)),
            Positioned(
                top: 150,
                left: 40,
                child: ProfileImageInProfile(image: profilepic)),
            Positioned(
                top: h * 0.4,
                left: 30,
                child: TitleNameInProfilePage(titleName: name)),
            Positioned(
              top: h * 0.28,
              left: w * 0.48,
              child: Container(
                height: h * 0.08,
                width: w * 0.55,
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomIconButton(
                        label: 'Like',
                        onPressed: () {
                          ref.read(likeProvider.state).state = !isLiked;
                        },
                        icon: isLiked
                            ? const Icon(
                                CupertinoIcons.heart_fill,
                                size: 40,
                                color: Colors.red,
                              )
                            : const Icon(
                                CupertinoIcons.heart,
                                size: 40,
                                color: Colors.red,
                              ),
                      ),
                      CustomIconButton(
                          label: 'Share',
                          onPressed: () {},
                          icon: const Icon(
                            Icons.share,
                            size: 40,
                            color: Colors.red,
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: h * 0.55,
              child: Container(
                height: 60,
                width: w,
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child:
                              CustomButton(title: 'More pics', onTap: () {})),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: CustomButton(title: 'Open URL', onTap: () {}))
                    ],
                  ),
                ),
              ),
            )
          ]),
        );
      }),
    );
  }
}
