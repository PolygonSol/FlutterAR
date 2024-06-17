import 'package:flutter/material.dart';

class SnackBarUtils {
  static void showResult(GlobalKey<ScaffoldState> scaffoldKey, String text) {
    if (scaffoldKey.currentState != null) {
      ScaffoldMessenger.maybeOf(scaffoldKey.currentContext!)!.showSnackBar(
          SnackBar(duration: const Duration(seconds: 1), content: Text(text,style: const TextStyle(color: Colors.black),)));
    } else {
      print(text);
    }
  }


}
