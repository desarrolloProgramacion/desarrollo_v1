import 'package:flutter/material.dart';
import 'package:smartmilk/ui/MainPage/MangerPage/ManagerPage.dart';

import '../../../utils/Colors.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Administrador',
          style: TextStyle(
            color: AppColors.primaryColor, // Color del texto
            fontSize: 20, // Tamaño del texto
            fontWeight: FontWeight.bold, // Opcional: negrita
          ),
        ),
        backgroundColor: AppColors.fourthColor, // Color de fondo del AppBar
        elevation: 4, // Opcional: sombra para destacar el AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primaryColor, ), // Color del ícono
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.radialGradient,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Escriba sus credenciales',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: AppColors.fifthColor, // Para que el texto contraste
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Nombre de usuario',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Código de usuario',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.fifthColor, // Color de fondo del botón
                    foregroundColor: Colors.white, // Color del texto
                    textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Bordes redondeados
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const managerPage()),
                    );
                  },
                  child: const Text('Iniciar sesión'),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

