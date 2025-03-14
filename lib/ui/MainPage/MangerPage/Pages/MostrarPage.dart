import 'package:flutter/material.dart';

class MostrarPage extends StatelessWidget {
  const MostrarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: const Center(
        child: Text(
          'Mostrar Vista',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
