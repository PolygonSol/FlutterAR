import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';
import 'cons.dart';

class AppTheme {
  static final ThemeData appTheme = ThemeData(
    primarySwatch: Colors.red,

    fontFamily: Cons.defaultFontFamily,
    backgroundColor: Colors.white,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    cardColor: Colors.white,
    unselectedWidgetColor: Colors.grey,
    bottomAppBarColor: Colors.grey.shade200,
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),
    scaffoldBackgroundColor: AppColors.scaffoldBackground,
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontFamily: Cons.defaultFontFamily,
      ),
      headline2: TextStyle(
        fontFamily: Cons.defaultFontFamily,
      ),
      headline3: TextStyle(
        fontFamily: Cons.defaultFontFamily,
      ),
      headline4: TextStyle(
        fontFamily: Cons.defaultFontFamily,
      ),
      headline5: TextStyle(
        fontFamily: Cons.defaultFontFamily,
      ),
      headline6: TextStyle(
        fontFamily: Cons.defaultFontFamily,
      ),
      bodyText1: TextStyle(
        fontFamily: Cons.defaultFontFamily,
      ),
      bodyText2: TextStyle(
        fontFamily: Cons.defaultFontFamily,
      ),
      subtitle1: TextStyle(
        fontFamily: Cons.defaultFontFamily,
      ),
      subtitle2: TextStyle(
        fontFamily: Cons.defaultFontFamily,
      ),
      caption: TextStyle(
        fontFamily: Cons.defaultFontFamily,
      ),
      overline: TextStyle(
        fontFamily: Cons.defaultFontFamily,
      ),
      button: TextStyle(
        fontFamily: Cons.defaultFontFamily,
        fontWeight: FontWeight.w600,
        fontSize: 16.0,
      ),
    ),
    appBarTheme: AppBarTheme(
        color: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.blue,
        ),
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        toolbarTextStyle: const TextTheme(
          headline6: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontStyle: FontStyle.normal,
            fontFamily: Cons.defaultFontFamily,
          ),
        ).bodyText2,
        titleTextStyle: const TextTheme(
          headline6: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontStyle: FontStyle.normal,
            fontFamily: Cons.defaultFontFamily,
          ),
        ).headline6),
    colorScheme: ColorScheme(
      background: Colors.white,
      onPrimary: Colors.white,
      onBackground: Colors.white,
      onError: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.white12,
      error: Colors.red,
      primary: Colors.grey,
      primaryContainer: Colors.grey,
      secondary: Colors.grey,
      //AppColor.secondary,
      secondaryContainer: Colors.grey.shade700,
      surface: Colors.white,
      brightness: Brightness.light,
    ),
  );
}
