import 'package:flutter/material.dart';
import '../../../../utils/Colors.dart';
import '../../../main.dart';
import '../../MainPage/UserPage/UserPage.dart';


class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _mostrarError = false;

  void _iniciarSesion() {
    setState(() {
      if (_usuarioController.text == "admin" && _passwordController.text == "1234") {
        _mostrarError = false;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const UserMain()), // Redirige a HomePage
        );
      } else {
        _mostrarError = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Iniciar Sesión",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.fifthColor,
              ),
            ),
            const SizedBox(height: 30),

            TextField(
              controller: _usuarioController,
              decoration: InputDecoration(
                labelText: "Usuario",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 15),

            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Contraseña",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 15),

            if (_mostrarError)
              const Text(
                "Usuario o contraseña incorrectos",
                style: TextStyle(color: Colors.red),
              ),
            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: _iniciarSesion,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.tertiaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text("Iniciar Sesión"),
            ),
          ],
        ),
      ),
    );
  }
}
