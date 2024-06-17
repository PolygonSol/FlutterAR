import 'package:flutter/material.dart';

class VerticalLineDashedPainter extends CustomPainter {
  Color? color;

  VerticalLineDashedPainter({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color ?? Colors.grey
      ..strokeWidth = 1;
    var max = size.height;
    var dashHeight = 16;
    var dashSpace = 4;
    double startY = 0;
    double xPosition = size.width / 2;
    while (max >= 0) {
      canvas.drawLine(Offset(xPosition, startY),
          Offset(xPosition, startY + dashHeight), paint);
      final space = (dashSpace + dashHeight);
      startY += space;
      max -= space;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
