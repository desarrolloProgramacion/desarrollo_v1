import 'package:flutter/material.dart';
import '../../../../../utils/Colors.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  // Datos de ejemplo del usuario (se pueden conectar a una BD)
  final Map<String, String> userInfo = {
    "nombre": "Juan Pérez",
    "correo": "juanperez@email.com",
    "telefono": "+57 312 345 6789",
    "rol": "Ganadero",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil"),
        backgroundColor: AppColors.fifthColor,
      ),
      body: Container(
        color: AppColors.primaryColor,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ícono de perfil
            const CircleAvatar(
              radius: 50,
              backgroundColor: AppColors.fifthColor,
              child: Icon(Icons.person, size: 80, color: Colors.black54),
            ),
            const SizedBox(height: 20),

            // Información del usuario
            _buildUserInfo("Nombre", userInfo["nombre"]!),
            _buildUserInfo("Correo", userInfo["correo"]!),
            _buildUserInfo("Teléfono", userInfo["telefono"]!),
            _buildUserInfo("Rol", userInfo["rol"]!),
          ],
        ),
      ),
    );
  }

  // Widget para mostrar cada dato del usuario
  Widget _buildUserInfo(String label, String value) {
    return Column(
      children: [
        Text(
          "$label: $value",
          style: const TextStyle(fontSize: 18, color: AppColors.fifthColor),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

