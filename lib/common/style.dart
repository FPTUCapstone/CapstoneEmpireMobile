import 'package:flutter/material.dart';

class AppStyles {
  static String fontFamily = 'SFProDisplay';

  static TextStyle text400({double fontsize = 22, Color color = Colors.black}) {
    return TextStyle(
      fontSize: fontsize,
      fontWeight: FontWeight.w400,
      fontFamily: fontFamily,
      color: color,
    );
  }

  static TextStyle header600(
      {double fontsize = 22, Color color = Colors.black}) {
    return TextStyle(
      fontSize: fontsize,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily,
      color: color,
    );
  }
}
