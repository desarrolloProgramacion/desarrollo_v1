import 'package:flutter/material.dart';
import '../../../../../utils/Colors.dart';

class PaymentsPage extends StatelessWidget {
   PaymentsPage({super.key});

  // Datos de ejemplo (se pueden conectar a una BD)
  final List<Map<String, dynamic>> pagosPendientes = [
    {"fecha": "10/03/2024", "litros": 120, "total": 30000},
    {"fecha": "15/03/2024", "litros": 95, "total": 23750},
    {"fecha": "20/03/2024", "litros": 110, "total": 27500},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagos Pendientes"),
        backgroundColor: AppColors.fifthColor,
      ),
      body: Container(
        color: AppColors.primaryColor,
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: pagosPendientes.length,
          itemBuilder: (context, index) {
            final pago = pagosPendientes[index];
            return Card(
              color: AppColors.fifthColor,
              child: ListTile(
                title: Text(
                  "Fecha: ${pago['fecha']}",
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
                subtitle: Text(
                  "Litros entregados: ${pago['litros']}\nTotal a pagar: \$${pago['total']}",
                  style: const TextStyle(fontSize: 16, color: Colors.white70),
                ),
                leading: const Icon(Icons.payment, color: Colors.white),
              ),
            );
          },
        ),
      ),
    );
  }
}

