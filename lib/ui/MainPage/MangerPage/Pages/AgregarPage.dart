import 'package:flutter/material.dart';

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
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void _agregarUsuario() {
    if (_formKey.currentState!.validate()) {
      String nombre = _nameController.text;
      String codigoUsuario = _userCodeController.text;
      String contrasena = _passwordController.text;

      // Aquí puedes manejar la lógica para guardar el usuario
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Usuario $nombre (Código: $codigoUsuario) agregado con éxito!',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ),
      );

      // Limpia los campos después de agregar
      _nameController.clear();
      _userCodeController.clear();
      _passwordController.clear();
      _confirmPasswordController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: AppColors.tertiaryColor, // Color primario
        scaffoldBackgroundColor: AppColors.secondaryColor, // Color de fondo
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: AppColors.primaryColor,
          border: OutlineInputBorder(),
          labelStyle: TextStyle(color: Colors.black),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.fourthColor, // Color del botón
            foregroundColor: Colors.white, // Color del texto del botón
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Agregar Usuario"),
          backgroundColor: AppColors.tertiaryColor, // Color del AppBar
          automaticallyImplyLeading: false, // Elimina el botón de retroceso
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
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _userCodeController,
                  decoration: const InputDecoration(labelText: "Código de Usuario"),
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
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: "Contraseña"),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return "La contraseña debe tener al menos 6 caracteres";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: const InputDecoration(labelText: "Confirmar Contraseña"),
                  obscureText: true,
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return "Las contraseñas no coinciden";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: _agregarUsuario,
                    child: const Text("Agregar"),
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
