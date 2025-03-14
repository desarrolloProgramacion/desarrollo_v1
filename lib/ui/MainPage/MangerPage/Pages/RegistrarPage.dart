import 'package:flutter/material.dart';

class RegistrarPage extends StatelessWidget {
  const RegistrarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: const Center(
        child: Text(
          'Registrar Vista',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
