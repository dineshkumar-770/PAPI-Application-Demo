import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SkeletonAnimation(
                          curve: Curves.easeIn,
                          borderRadius: BorderRadius.circular(100),
                          shimmerDuration: 1000,
                          shimmerColor: Colors.grey,
                          child: const CircleAvatar(
                            radius: 100,
                            backgroundColor: Colors.white60,
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SkeletonAnimation(
                          curve: Curves.easeIn,
                          shimmerColor: Colors.grey,
                          child: Container(
                            height: 30,
                            width: 100,
                            color: Colors.white60,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SkeletonAnimation(
                          curve: Curves.easeIn,
                          shimmerColor: Colors.grey,
                          child: Container(
                            height: 30,
                            width: 175,
                            color: Colors.white60,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SkeletonAnimation(
                          curve: Curves.easeIn,
                          shimmerColor: Colors.grey,
                          child: Container(
                            height: 30,
                            width: 140,
                            color: Colors.white60,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SkeletonAnimation(
                          curve: Curves.easeIn,
                          shimmerColor: Colors.grey,
                          child: Container(
                            height: 30,
                            width: 100,
                            color: Colors.white60,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 75,
                ),
              ],
            );
          }),
    );
  }
}
