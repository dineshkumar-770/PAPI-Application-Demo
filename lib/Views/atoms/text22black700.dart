import 'package:flutter/material.dart';

class Text22Black700 extends StatelessWidget {
  const Text22Black700({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.displaySmall?.copyWith(
          color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500),
    );
  }
}
