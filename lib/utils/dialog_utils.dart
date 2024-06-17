import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DialogUtils {
  static DialogUtils _instance = DialogUtils.internal();

  DialogUtils.internal();

  factory DialogUtils() => _instance;

  static void showError(BuildContext context, PlatformException exception) {
    showDialog(
        context: context,
        builder: (_) {
          String? error = exception.code.isNotEmpty ? exception.code : exception.message;
          String errorMessage = error != null ? error : "unexpected error";

          return AlertDialog(title: Text(errorMessage), actions: <Widget>[
            _buildButton("OK", context, null),
          ]);
        });
  }

  static void showOneBtn(BuildContext context, String titleText) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(title: Text(titleText), actions: <Widget>[
            _buildButton("OK", context, null),
          ]);
        });
  }

  static void showTwoBtn(BuildContext context, String titleText, Function? accept, Function? decline) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(title: Text(titleText), actions: <Widget>[
            _buildButton("Accept", context, () => accept?.call()),
            _buildButton("Decline", context, () => decline?.call())
          ]);
        });
  }
 static void showImageDialog(BuildContext context, String titleText, Function? cameraFun, Function? galleryFun) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
              actionsAlignment: MainAxisAlignment.start,
              actions: <Widget>[

            _buildButton("Select image from camera", context, () => cameraFun?.call()),
            _buildButton("Select image from gallery", context, () => galleryFun?.call())
          ]);
        });
  }

  static Widget _buildButton(String title, BuildContext context, Function? callback) {
    return TextButton(

        child: Text(title,textAlign: TextAlign.center,),
        onPressed: () {
          callback?.call();
          Navigator.pop(context);
        });
  }
}
