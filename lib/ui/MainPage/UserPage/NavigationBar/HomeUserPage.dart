import 'package:flutter/material.dart';
import '../../../../../utils/Colors.dart';

class HomeUserPage extends StatelessWidget {
  const HomeUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.home, // Puedes cambiarlo por otro ícono relevante
              size: 80,
              color: Colors.green,
            ),
            SizedBox(height: 20),
            Text(
              "Bienvenido a ASOPROGANUCOT",
              style: TextStyle(fontSize: 22, color: AppColors.fifthColor, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

