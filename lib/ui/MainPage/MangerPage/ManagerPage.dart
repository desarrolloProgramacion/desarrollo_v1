import 'package:flutter/material.dart';

class managerPage extends StatelessWidget {
  const managerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: const Center(
        child: Text(
          'Bienvenido al Panel de Administrador',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
