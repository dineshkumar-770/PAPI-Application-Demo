import 'package:flutter/material.dart';

class Text20Black300 extends StatelessWidget {
  const Text20Black300({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.displaySmall?.copyWith(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300),
    );
  }
}
