import 'package:flutter/material.dart';

class AgregarPage extends StatelessWidget {
  const AgregarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const Center(
        child: Text(
          'Agregar Vista',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}