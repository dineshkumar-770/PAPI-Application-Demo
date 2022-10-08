import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:riverpod_understanding/Views/screens/home_page.dart';
import 'package:riverpod_understanding/provider/providers.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  final PageController _pageController = PageController();
  final OnBoardState onBoardState = OnBoardState();
  List<OnBoardModel> onBoardData = [
    const OnBoardModel(
        title: 'Title 1',
        description: 'Description 1',
        imgUrl: 'assets/images/onboard/image1.jpg'),
    const OnBoardModel(
        title: 'Title 2',
        description: 'Description 2',
        imgUrl: 'assets/images/onboard/image2.jpg'),
    const OnBoardModel(
        title: 'Title 3',
        description: 'Description 3',
        imgUrl: 'assets/images/onboard/image3.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoard(
          titleStyles: Theme.of(context).textTheme.displaySmall,
          descriptionStyles: Theme.of(context).textTheme.bodyLarge,
          pageIndicatorStyle: const PageIndicatorStyle(
              activeSize: Size(15, 15),
              inactiveSize: Size(8, 8),
              width: 75,
              inactiveColor: Colors.blue,
              activeColor: Colors.orange),
          onSkip: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return  HomeScreen();
            }));
          },
          onDone: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return  HomeScreen();
            }));
          },
          onBoardData: onBoardData,
          pageController: _pageController),
    );
  }
}
