import 'package:flutter/material.dart';
import '../../../../utils/Colors.dart';

class RegistrarPage extends StatefulWidget {
  const RegistrarPage({super.key});

  @override
  _RegistrarPageState createState() => _RegistrarPageState();
}

class _RegistrarPageState extends State<RegistrarPage> {
  final TextEditingController codigoController = TextEditingController();
  final TextEditingController litrosController = TextEditingController();
  String mensajeConfirmacion = '';

  void confirmarRecepcion() {
    setState(() {
      mensajeConfirmacion =
      "Recepción confirmada\nCódigo: ${codigoController.text}\nLitros: ${litrosController.text}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor, // Fondo personalizable
      appBar: AppBar(
        title: const Text('Registro de Entrega de Leche'),
        backgroundColor: AppColors.tertiaryColor, // Color de la AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Registro de Entrega de Leche',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Escaneo QR
            Center(
              child: Column(
                children: [
                  Icon(Icons.qr_code_scanner, size: 100, color: AppColors.fifthColor),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Aquí puedes agregar la lógica para escanear QR
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.fifthColor,
                      foregroundColor: AppColors.primaryColor,
                    ),
                    child: const Text('Escanear QR'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Código manual
            const Text(
              'Ingresar código manualmente:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: codigoController,
              decoration: InputDecoration(
                hintText: 'Ingrese el código aquí',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: AppColors.secondaryColor,
              ),
            ),

            const SizedBox(height: 16),

            // Litros entregados
            const Text(
              'Ingrese los litros entregados:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: litrosController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Ingrese los litros',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: AppColors.secondaryColor,
              ),
            ),

            const SizedBox(height: 16),

            // Confirmar recepción
            Center(
              child: ElevatedButton(
                onPressed: confirmarRecepcion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.fifthColor,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Confirmar Recepción'),
              ),
            ),

            const SizedBox(height: 16),

            // Mensaje de confirmación
            if (mensajeConfirmacion.isNotEmpty)
              Center(
                child: Text(
                  mensajeConfirmacion,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}


