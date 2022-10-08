import 'package:flutter/material.dart';

class TitleNameInProfilePage extends StatelessWidget {
  const TitleNameInProfilePage({super.key,required this.titleName});

  final String titleName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        titleName,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .displaySmall!
            .copyWith(color: Colors.white, fontSize: 35),
      ),
    );
  }
}
