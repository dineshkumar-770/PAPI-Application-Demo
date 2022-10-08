import 'package:flutter/material.dart';
import 'package:riverpod_understanding/Views/atoms/text20black300.dart';
import 'package:riverpod_understanding/Views/atoms/text22black700.dart';
import 'package:riverpod_understanding/Views/molecule/picture_card.dart';
import 'package:riverpod_understanding/constants/constants.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard(
      {super.key, this.name, this.image, this.age, this.rank, this.size, required this.herotage});
  final String? name;
  final String? rank;
  final String? size;
  final String? image;
  final String? age;
  final String herotage;
  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        children: [
          Container(
            height: h * 0.3,
            width: w,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: PictureCard(
                    imageUrl: image!.isEmpty?defaultImage:image.toString(),
                    herotag: herotage,
                  ),
                ),
                const Divider(
                  thickness: 2,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: w * 0.35,
                        child: Text20Black300(
                          text: rank!.isEmpty?'No Rank':'Rank $rank',
                        ),
                      ),
                      const Divider(
                        endIndent: 20,
                        indent: 20,
                        color: Colors.yellow,
                        thickness: 1.5,
                      ),
                      SizedBox(
                        width: w * 0.35,
                        child: Text22Black700(
                          text: name!.isEmpty?'No Name':name.toString(),
                        ),
                      ),
                      const Divider(
                        color: Colors.transparent,
                      ),
                      SizedBox(
                        width: w * 0.35,
                        child: Text20Black300(
                          text: size!.isEmpty?'No Size':size.toString(),
                        ),
                      ),
                      SizedBox(
                        width: w * 0.35,
                        child: Text20Black300(
                          text: age!.isEmpty?'Age -' : 'Age ${age ?? '-'}',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const Divider(
            thickness: 2.5,
            endIndent: 30,
            indent: 30,
            color: Colors.amber,
          ),
        ],
      ),
    );
  }
}
