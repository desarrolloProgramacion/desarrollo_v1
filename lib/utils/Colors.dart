import 'package:flutter/material.dart';

class AppColors {
  // Colores base más modernos estilo iOS - tonos más suaves y elegantes
  static const Color primaryColor = Color(0xFFF5F5F7); // Gris muy claro, casi blanco
  static const Color secondaryColor = Color(0xFFE8F4F8); // Azul muy suave
  static const Color tertiaryColor = Color(0xFFB8E6D5); // Verde agua claro
  static const Color fourthColor = Color(0xFF7BC4B8); // Verde azulado medio
  static const Color fifthColor = Color(0xFF5A9D8C); // Verde azulado profundo

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

