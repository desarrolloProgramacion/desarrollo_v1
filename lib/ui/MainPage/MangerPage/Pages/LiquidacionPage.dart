import 'package:flutter/material.dart';

class LiquidacionPage extends StatelessWidget {
  const LiquidacionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: const Center(
        child: Text(
          'Liquidación Vista',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
