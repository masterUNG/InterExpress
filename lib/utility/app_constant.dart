import 'package:flutter/material.dart';

class AppConstant {
  //field
  static String appName = 'IEL project';

  static Color bgColor = const Color.fromARGB(255, 40, 202, 234);

  //method

  BoxDecoration basicBox() {
    return BoxDecoration(color: bgColor.withOpacity(0.35));
  }

  BoxDecoration linearBox() {
    return BoxDecoration(
      gradient: LinearGradient(
          colors: [Colors.white, Colors.white, bgColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter),
    );
  }

  BoxDecoration radioBox() {
    return BoxDecoration(
      gradient: RadialGradient(
        colors: [Colors.white, bgColor],
        radius: 1.0,
        center: Alignment(-0.5, -0.5),
      ),
    );
  }

  TextStyle h1Style({double? size}) {
    return TextStyle(
      fontSize: size ?? 48,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle h2Style() {
    return const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle h3Style() {
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );
  }
}
