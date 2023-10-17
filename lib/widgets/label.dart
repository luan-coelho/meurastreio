import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  const Label({super.key, required this.text, this.textAlign = TextAlign.start});

  final String text;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        textAlign: textAlign);
  }
}
