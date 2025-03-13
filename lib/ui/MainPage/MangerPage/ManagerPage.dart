import 'package:flutter/material.dart';

class managerPage extends StatefulWidget {
  const managerPage({super.key});

  @override
  _managerPageState createState() => _managerPageState();
}

class _managerPageState extends State<managerPage> {
  bool isExpanded = false;
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
          Expanded(
            flex: isExpanded ? 0 : 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildButton('Agregar', Container(color: Colors.blue, child: Center(child: Text('Agregar Vista')))),
                buildButton('Registrar', Container(color: Colors.green, child: Center(child: Text('Registrar Vista')))),
                buildButton('Mostrar', Container(color: Colors.orange, child: Center(child: Text('Mostrar Vista')))),
                buildButton('Liquidación', Container(color: Colors.red, child: Center(child: Text('Liquidación Vista')))),
              ],
            ),
          ),
          Expanded(
            flex: isExpanded ? 10 : 6,
            child: Stack(
              children: [
                Container(
                  color: Colors.grey[200],
                  child: selectedView ?? Center(child: Text('Seleccione una opción', style: TextStyle(fontSize: 18))),
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
