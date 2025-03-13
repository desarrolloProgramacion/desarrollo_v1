import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFFf8f6f1);
  static const Color secondaryColor = Color(0xFFe1eae5);
  static const Color tertiaryColor = Color(0xFFa7d7b8);
  static const Color fourthColor = Color(0xFF66b2a0);
  static const Color fifthColor = Color(0xFF4e796b);

  // Degradado lineal
  static const LinearGradient linearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryColor, secondaryColor,tertiaryColor, fourthColor, fifthColor],
  );

  // Degradado radial
  static const RadialGradient radialGradient = RadialGradient(
    center: Alignment.center,
    radius: 0.8,
    colors: [primaryColor, secondaryColor,tertiaryColor, fourthColor, fifthColor],
  );
}


