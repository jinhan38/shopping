import 'package:flutter/material.dart';

class style {
  static final outline = OutlinedButton.styleFrom(
    primary: Colors.orange,
    side: const BorderSide(width: 0, color: Colors.transparent),
  );

  static final elevated = ElevatedButton.styleFrom(
    onPrimary: Colors.orange,
    primary: Colors.white,
    elevation: 0,
  );

  static final button = ButtonStyle(
    overlayColor: getColor(Colors.white, Colors.orange),
    elevation: MaterialStateProperty.resolveWith<double>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return 16;
        }
        return 0;
      },
    ),
  );

  static MaterialStateProperty<Color> getColor(
      Color backgroundColor, Color colorPressed) {
    styleColor(Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return colorPressed;
      } else {
        return backgroundColor;
      }
    }
    return MaterialStateProperty.resolveWith(styleColor);
  }
}
