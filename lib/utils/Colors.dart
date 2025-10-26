import 'package:flutter/material.dart';

class AppColors {
  // Colores base modernos con tonos azules profundos y elegantes
  static const Color primaryColor = Color(0xFF0A1128); // Azul marino profundo
  static const Color secondaryColor = Color(0xFF1B2845); // Azul oscuro
  static const Color tertiaryColor = Color(0xFF2E4F6E); // Azul medio
  static const Color fourthColor = Color(0xFF4A7BA7); // Azul cielo
  static const Color fifthColor = Color(0xFF6BA3D4); // Azul brillante

  // Degradado lineal
  static const LinearGradient linearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryColor, secondaryColor, tertiaryColor, fourthColor, fifthColor],
  );

  // Degradado radial
  static const RadialGradient radialGradient = RadialGradient(
    center: Alignment.center,
    radius: 0.8,
    colors: [primaryColor, secondaryColor, tertiaryColor, fourthColor, fifthColor],
  );
}