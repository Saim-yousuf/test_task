import 'package:flutter/material.dart';

class Palette {
  // Theme primary color shades
  static const MaterialColor themeColor = MaterialColor(
    0xFF4D81E7, // new main color from gradient start
    <int, Color>{
      50: Color(0xFFE2F4EB),
      100: Color(0xFFB8E3CC),
      200: Color(0xFF89D1AB),
      300: Color(0xFF5BBF8A),
      400: Color(0xFF38B271),
      500: Color(0xFF005694),
      600: Color(0xFF1B854C),
      700: Color(0xFF167243),
      800: Color(0xFF125F3A),
      900: Color(0xFF0A402A),
    },
  );

  // Solid colors
  static const Color primary = Color(0xffF6F5FA);
  static const Color secondary = Color(0xff1F2630);
  static const Color backLight = Color(0xff0D182F);
  static const Color background = Color(0xff030E26);
  static const Color black = Color(0xff101010);
  static const Color white = Colors.white;
  static const Color lightGrey = Color(0xFFF4F4F4);
  static const Color grey = Color(0xffE0E0E0);
  static const Color greyText = Color.fromARGB(255, 146, 141, 141);
  static const Color greyText1 = Color(0xff959595);
  static const Color darkGrey = Color(0xff2A2727);
  static const Color red = Color(0xffF9113B);
  static const Color yellow = Color(0xffFCBE47);
  static const Color orange = Color(0xffF09F33);
  static const Color green = Color(0xff10CE8F);
  static const Color greenDark = Color(0xff059212);
  static const Color authButton = Color(0xff8E7F47);
  static const Color blue = Color(0xff1877F2);
  static const Color appColor = Color(0xff1877F2);
  static const Color greyBlue = Color(0xff7aa5ba);
  static const Color textField = Color(0xffF4F4F4);
  static const Color brown = Color(0xffC68304);
  static const Color brown2 = Color(0xffc79e52);
  static const Color purple = Color(0xff800080);
  static const Color lightBrown = Color(0xffC8A575);
  static const Color brown3 = Color(0xff836A57);
  static const Color pink = Color(0xffEC008C);
  static const Color pink2 = Color(0xffFD3C5A);
  static const Color darkBlue = Color(0xff0E2936);
  static const Color lightGreen = Color(0xffB2CCB3);
  static const Color green2 = Color(0xff37B44E);
  static const Color greenShade1 = Color(0xff95B56A);
  static const Color darkGreen = Color(0xff1f4b43);
  static const Color orangeButton1 = Color(0xffFCBE47);
  static const Color orangeButton2 = Color(0xffFF820E);
  static const Color bckgrnd1 = Color(0xffF2EBE2);
  static const Color bckgrnd2 = Color(0xffC2ECFA);
  static const Color bckgrnd3 = Color(0xffF1FAFD);
  static const Color lightYellow = Color(0xffFDFEB0);
  static const Color lightGreen2 = Color(0xffCEF0AC);
  static const Color golden = Color(0xffD5AF33);
  static const Color bookButton = Color(0xffd4baa9);
  static const Color knRed = Color.fromARGB(211, 254, 0, 0);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF005694), // First color
      Color(0xFF0090FF), // Second color
    ],
    stops: [0.0746, 0.544],
  );

  static const LinearGradient greenGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xff37B44E),
      Color(0xff1F9355),
    ],
  );

  static const LinearGradient orangeGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xffFCBE47),
      Color(0xffFF820E),
    ],
  );

  static const LinearGradient blueGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xff1877F2),
      Color(0xff005694),
    ],
  );
}
