import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../utils/Colors.dart';

class MostrarPage extends StatefulWidget {
  const MostrarPage({super.key});

  @override
  _MostrarPageState createState() => _MostrarPageState();
}

class _MostrarPageState extends State<MostrarPage> {
  final TextEditingController _codigoController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  DateTime? _fechaSeleccionada;
  String _usuarioInfo = '';

  void _seleccionarFecha(BuildContext context) async {
    final DateTime? fechaSeleccionada = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.tertiaryColor,
            colorScheme: ColorScheme.light(primary: AppColors.tertiaryColor),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (fechaSeleccionada != null) {
      setState(() {
        _fechaSeleccionada = fechaSeleccionada;
      });
    }
  }

  void _mostrarDatos() {
    setState(() {
      _usuarioInfo = '''
      Usuario: ${_nombreController.text.isNotEmpty ? _nombreController.text : "Desconocido"}
      Código: ${_codigoController.text.isNotEmpty ? _codigoController.text : "No ingresado"}
      Fecha: ${_fechaSeleccionada != null ? DateFormat('dd/MM/yyyy').format(_fechaSeleccionada!) : "No seleccionada"}
      Litros entregados: 250
      Sueldo: \$500.00
      ''';
    });
  }

  void _descargarInforme() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Informe PDF descargado correctamente"),
        backgroundColor: AppColors.fourthColor,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: const Text('Mostrar Datos del Usuario'),
        backgroundColor: AppColors.tertiaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Buscar Usuario',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Campo para ingresar código
            TextField(
              controller: _codigoController,
              decoration: InputDecoration(
                labelText: 'Código del usuario',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 10),

            // Campo para ingresar nombre
            TextField(
              controller: _nombreController,
              decoration: InputDecoration(
                labelText: 'Nombre del usuario',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 16),

            // Selector de fecha
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => _seleccionarFecha(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.fifthColor,
                    foregroundColor: AppColors.primaryColor,
                  ),
                  child: const Text('Seleccionar Fecha'),
                ),
                const SizedBox(width: 10),
                Text(
                  _fechaSeleccionada != null
                      ? DateFormat('dd/MM/yyyy').format(_fechaSeleccionada!)
                      : 'Ninguna fecha seleccionada',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Botón para mostrar datos
            Center(
              child: ElevatedButton(
                onPressed: _mostrarDatos,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.fifthColor,
                  foregroundColor: AppColors.primaryColor,
                ),
                child: const Text('Mostrar Datos'),
              ),
            ),
            const SizedBox(height: 20),

            // Mostrar los datos del usuario
            _usuarioInfo.isNotEmpty
                ? Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.secondaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.tertiaryColor),
              ),
              child: Text(
                _usuarioInfo,
                style: const TextStyle(fontSize: 16),
              ),
            )
                : Container(),

            const SizedBox(height: 20),

            // Botón para descargar informe PDF
            Center(
              child: ElevatedButton(
                onPressed: _descargarInforme,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.fourthColor,
                  foregroundColor: AppColors.primaryColor,
                ),
                child: const Text('Descargar Informe en PDF'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

