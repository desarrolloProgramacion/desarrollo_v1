import 'package:flutter/material.dart';
import 'package:smartmilk/ui/Login/Manager/ProfileUser.dart';
import 'package:smartmilk/ui/Login/User/ProfileUser.dart';
import 'package:smartmilk/utils/Colors.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SmartMilk',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.radialGradient,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bienvenido a ASOPROGANUCOT\n'
                    'elige tu tipo de usuario',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: AppColors.fifthColor),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(AppColors.fifthColor), // Color de fondo
                  foregroundColor: MaterialStateProperty.all<Color>(AppColors.primaryColor), // Color del texto
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    TextStyle(fontSize: 20),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AdminPage()),
                  );
                },
                child: const Text('Administrador'),
              )
              ,
              const SizedBox(height: 10),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(AppColors.fifthColor), // Color de fondo
                  foregroundColor: MaterialStateProperty.all<Color>(AppColors.primaryColor), // Color del texto
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    TextStyle(fontSize: 20),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UserPage()),
                  );
                },
                child: const Text('Usuario'),
              )

            ],
          ),
        ),
      ),
    );
  }
}



