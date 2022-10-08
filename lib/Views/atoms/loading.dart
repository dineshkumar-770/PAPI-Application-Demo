import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class StaggredDotsLoading extends StatelessWidget {
  const StaggredDotsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
              color: Colors.amber, size: 60),
        ),
        Text(
          'Hang on! it\'s loading...',
          style:
              Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 15),
        ),
      ],
    );
  }
}
