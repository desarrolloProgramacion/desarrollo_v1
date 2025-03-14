import 'package:flutter/material.dart';
import '../../../../utils/Colors.dart';

class UserMain extends StatelessWidget {
  const UserMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pantalla Principal"),
        backgroundColor: AppColors.secondaryColor,
      ),
      body: Center(
        child: Text(
          "Bienvenido a la aplicación",
          style: TextStyle(fontSize: 20, color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
