import 'package:flutter/material.dart';
import 'package:smartmilk/ui/MainPage/MangerPage/ManagerPage.dart';

import '../../../utils/Colors.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                AppBar(
                  title: const Text('Administrador'),
                  backgroundColor: Colors.transparent,
                  elevation: 0, // Elimina la sombra
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Escriba sus credenciales',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Para que el texto contraste
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
