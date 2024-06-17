import 'package:flutter/material.dart';

class LineDashedPainter extends CustomPainter {
  Color? color;
  LineDashedPainter({this.color});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color ?? Colors.grey
      ..strokeWidth = 1;
    var max = size.width;
    var dashWidth = 2;
    var dashSpace = 2;
    double startX = 0;
    double yPosition = size.height;
    while (max >= 0) {
      canvas.drawLine(Offset(startX, yPosition),
          Offset(startX + dashWidth, yPosition), paint);
      final space = (dashSpace + dashWidth);
      startX += space;
      max -= space;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}