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
                color: AppColors.fifthColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: const Icon(Icons.menu),
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
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.info),
                        onPressed: () {},
                      ),
                    ],
                    buildButton('Agregar', const AgregarPage()),
                    buildButton('Registrar', const RegistrarPage()),
                    buildButton('Mostrar', const MostrarPage()),
                    buildButton('Liquidación', const LiquidacionPage()),
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
                      const Center(
                        child: Text(
                          'Seleccione una opción',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Icon(isExpanded ? Icons.fullscreen_exit : Icons.fullscreen),
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
        child: Text(text),
      ),
    );
  }
}
