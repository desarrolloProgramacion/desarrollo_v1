import 'package:flutter/material.dart';
import '../../../utils/Colors.dart';
import 'Pages/AgregarPage.dart';
import 'Pages/LiquidacionPage.dart';
import 'Pages/MostrarPage.dart';
import 'Pages/RegistrarPage.dart';

class managerPage extends StatefulWidget {
  const managerPage({super.key});

  @override
  _managerPageState createState() => _managerPageState();
}

class _managerPageState extends State<managerPage> {
  bool isExpanded = false;
  bool showExtraIcons = false;
  Widget? selectedView;

  void changeView(Widget view) {
    setState(() {
      selectedView = view;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          if (!isExpanded)
            Expanded(
              flex: 2,
              child: Container(
                color: AppColors.fifthColor, // Color de fondo del menú lateral
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: const Icon(Icons.menu),
                        color: AppColors.primaryColor, // Color del ícono
                        onPressed: () {
                          setState(() {
                            showExtraIcons = !showExtraIcons;
                          });
                        },
                      ),
                    ),
                    if (showExtraIcons) ...[
                      IconButton(
                        icon: const Icon(Icons.settings),
                        color: AppColors.secondaryColor, // Color del ícono
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.info),
                        color: AppColors.secondaryColor, // Color del ícono
                        onPressed: () {},
                      ),
                    ],
                    buildButton('Agregar un nuevo Usuario.', const AgregarPage()),
                    buildButton('Registrar produccion lactea.', const RegistrarPage()),
                    buildButton('Mostrar datos usuarios registrados.', const MostrarPage()),
                    buildButton('Liquidación de ususarios.', const LiquidacionPage()),
                  ],
                ),
              ),
            ),

          Expanded(
            flex: 10,
            child: Stack(
              children: [
                Container(
                  color: AppColors.fifthColor,
                  child: selectedView ??
                      Center(
                        child: Text(
                          'Seleccione una opción',
                          style: TextStyle(fontSize: 18, color: AppColors.primaryColor),
                        ),
                      ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: FloatingActionButton(
                    backgroundColor: AppColors.secondaryColor, // Color del botón flotante
                    onPressed: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Icon(
                      isExpanded ? Icons.fullscreen_exit : Icons.fullscreen,
                      color: AppColors.primaryColor, // Color del ícono
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton(String text, Widget view) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () => changeView(view),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondaryColor, // Color de fondo del botón
          foregroundColor: AppColors.fifthColor, // Color del texto
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Bordes redondeados
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
