import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Para formato de fecha
import '../../../../utils/Colors.dart';

class LiquidacionPage extends StatefulWidget {
  const LiquidacionPage({super.key});

  @override
  _LiquidacionPageState createState() => _LiquidacionPageState();
}

class _LiquidacionPageState extends State<LiquidacionPage> {
  final List<String> usuarios = ["Juan Pérez", "María López", "Carlos Gómez"];
  String? usuarioSeleccionado;
  DateTime? fechaSeleccionada;
  String mensajePago = '';

  // Función para seleccionar fecha
  Future<void> _seleccionarFecha(BuildContext context) async {
    DateTime? fecha = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.fifthColor,
            colorScheme: ColorScheme.light(primary: AppColors.fifthColor),
            buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (fecha != null) {
      setState(() {
        fechaSeleccionada = fecha;
      });
    }
  }

  // Función para calcular pago (simulado)
  void mostrarPagos() {
    if (usuarioSeleccionado == null || fechaSeleccionada == null) {
      setState(() {
        mensajePago = "Seleccione un usuario y una fecha.";
      });
      return;
    }

    // Simulación de litros y pago
    int litrosEntregados = 120; // Simulación
    double valorPorLitro = 1500; // Simulación
    double totalPagar = litrosEntregados * valorPorLitro;

    setState(() {
      mensajePago =
      "Usuario: $usuarioSeleccionado\nFecha: ${DateFormat('dd/MM/yyyy').format(fechaSeleccionada!)}\n"
          "Litros entregados: $litrosEntregados\nValor a pagar: \$${totalPagar.toStringAsFixed(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor, // Fondo personalizable
      appBar: AppBar(
        title: const Text('Módulo de Pagos'),
        backgroundColor: AppColors.tertiaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Seleccione un usuario:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Dropdown de usuarios
            DropdownButtonFormField<String>(
              value: usuarioSeleccionado,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: AppColors.secondaryColor,
              ),
              items: usuarios.map((usuario) {
                return DropdownMenuItem(value: usuario, child: Text(usuario));
              }).toList(),
              onChanged: (valor) {
                setState(() {
                  usuarioSeleccionado = valor;
                });
              },
            ),

            const SizedBox(height: 16),

            // Selección de fecha
            const Text(
              'Seleccione una fecha:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => _seleccionarFecha(context),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      fechaSeleccionada == null
                          ? 'Seleccionar fecha'
                          : DateFormat('dd/MM/yyyy').format(fechaSeleccionada!),
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Icon(Icons.calendar_today),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Botón para mostrar pagos
            Center(
              child: ElevatedButton(
                onPressed: mostrarPagos,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.fifthColor,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Mostrar Pagos'),
              ),
            ),

            const SizedBox(height: 16),

            // Resultado de pago
            if (mensajePago.isNotEmpty)
              Center(
                child: Text(
                  mensajePago,
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

