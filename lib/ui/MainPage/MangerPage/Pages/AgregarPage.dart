import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../utils/Colors.dart';

class AgregarPage extends StatefulWidget {
  const AgregarPage({super.key});

  @override
  _AgregarPageState createState() => _AgregarPageState();
}

class _AgregarPageState extends State<AgregarPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _userCodeController = TextEditingController();
  final TextEditingController _cedulaController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();

  bool _isQrGenerated = false;
  String? _qrData;

  void _agregarUsuario() {
    if (_formKey.currentState!.validate()) {
      String nombre = _nameController.text;
      String codigoUsuario = _userCodeController.text;
      String cedula = _cedulaController.text;
      String telefono = _telefonoController.text;

      // Aquí puedes manejar la lógica para guardar el usuario
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Usuario $nombre (Código: $codigoUsuario, Cédula: $cedula, Teléfono: $telefono) agregado con éxito!',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ),
      );

      // Limpia los campos después de agregar
      _nameController.clear();
      _userCodeController.clear();
      _cedulaController.clear();
      _telefonoController.clear();

      setState(() {
        _isQrGenerated = false;
        _qrData = null;
      });
    }
  }

  void _generarQR() {
    String nombre = _nameController.text;
    String codigoUsuario = _userCodeController.text;
    String cedula = _cedulaController.text;
    String telefono = _telefonoController.text;

    setState(() {
      _qrData =
          'Nombre: $nombre\nCódigo Usuario: $codigoUsuario\nCédula: $cedula\nTeléfono: $telefono';
      _isQrGenerated = true;
    });
  }

  bool _todosCamposLlenos() {
    return _nameController.text.isNotEmpty &&
        _userCodeController.text.isNotEmpty &&
        _cedulaController.text.isNotEmpty &&
        _telefonoController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: AppColors.tertiaryColor,
        scaffoldBackgroundColor: AppColors.secondaryColor,
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: AppColors.primaryColor,
          border: OutlineInputBorder(),
          labelStyle: TextStyle(color: Colors.black),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.fourthColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Agregar Usuario"),
          backgroundColor: AppColors.tertiaryColor,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: "Nombre"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor ingrese el nombre";
                    }
                    return null;
                  },
                  onChanged: (value) => setState(() {}),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _userCodeController,
                  decoration: const InputDecoration(
                    labelText: "Código Usuario",
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Ingrese un código de usuario";
                    }
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return "El código debe ser numérico";
                    }
                    return null;
                  },
                  onChanged: (value) => setState(() {}),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _cedulaController,
                  decoration: const InputDecoration(labelText: "Cédula"),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Ingrese la cédula";
                    }
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return "La cédula debe ser numérica";
                    }
                    return null;
                  },
                  onChanged: (value) => setState(() {}),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _telefonoController,
                  decoration: const InputDecoration(labelText: "Teléfono"),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Ingrese el teléfono";
                    }
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return "El teléfono debe ser numérico";
                    }
                    return null;
                  },
                  onChanged: (value) => setState(() {}),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _agregarUsuario,
                      child: const Text("Agregar"),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: _todosCamposLlenos() ? _generarQR : null,
                      child: const Text("Generar Código QR"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            _todosCamposLlenos()
                                ? AppColors.fourthColor
                                : Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                if (_isQrGenerated && _qrData != null && _qrData!.isNotEmpty)
                  Center(
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: QrImageView(
                          data: _qrData ?? '',
                          version: QrVersions.auto,
                          size: 200.0,
                        ),
                      ),
                    ),
                  ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
