import 'package:flutter/material.dart';

import 'colors.dart';
import 'images.dart';

BoxDecoration bg_decoration = BoxDecoration(
  image: DecorationImage(
      image: AssetImage(bg_gradient),
      alignment: Alignment.topCenter,
      fit: BoxFit.fitWidth,
    ),
  /*gradient: LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xCC36D1DC), Color(0xCC5B86E5)],
  ),*/
  color: const Color(0xFFF7F8F9),
);

ButtonStyle blackButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(AppColors.black),
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
  ),
);
