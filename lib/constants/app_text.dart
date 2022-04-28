import 'package:flutter/material.dart';

class LargeText extends StatelessWidget {
  const LargeText({
    Key? key,
    this.size = 30,
    required this.text,
    this.color = Colors.black,
  }) : super(key: key);
  final double size;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class MediumText extends StatelessWidget {
  const MediumText({
    Key? key,
    this.size = 16,
    required this.text,
    this.color = Colors.black54,
    this.align,
  }) : super(key: key);
  final double size;
  final String text;
  final Color color;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
    );
  }
}
