import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final TextStyle? style;
  final LinearGradient gradient;
  final String text;

  const GradientText(
      {required this.text, required this.gradient, this.style, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(bounds),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
