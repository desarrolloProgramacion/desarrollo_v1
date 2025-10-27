import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:intl/intl.dart'; // Para formato de fecha
import '../../../../utils/Colors.dart';

class LiquidacionPage extends StatefulWidget {
  const LiquidacionPage({super.key});

  @override
  _LiquidacionPageState createState() => _LiquidacionPageState();
}

class _LiquidacionPageState extends State<LiquidacionPage> {
  final List<String> usuarios = ["Juan Pérez", "María López", "Carlos Gómez"];
  String? usuarioSeleccionado;
  DateTime? fechaSeleccionada;
  String mensajePago = '';

  // Función para seleccionar fecha
  Future<void> _seleccionarFecha(BuildContext context) async {
    DateTime? fecha = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            primaryColor: AppColors.fifthColor,
            colorScheme: ColorScheme.dark(
              primary: AppColors.fifthColor,
              onPrimary: Colors.white,
              surface: AppColors.secondaryColor,
              onSurface: Colors.white,
            ),
            dialogBackgroundColor: AppColors.tertiaryColor,
          ),
          child: child!,
        );
      },
    );
    if (fecha != null) {
      setState(() {
        fechaSeleccionada = fecha;
      });
    }
  }

  // Función para calcular pago (simulado)
  void mostrarPagos() {
    if (usuarioSeleccionado == null || fechaSeleccionada == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            "Por favor seleccione un usuario y una fecha",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.orange,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
      return;
    }

    // Simulación de litros y pago
    int litrosEntregados = 120; // Simulación
    double valorPorLitro = 1500; // Simulación
    double totalPagar = litrosEntregados * valorPorLitro;

    setState(() {
      mensajePago =
      "Usuario: $usuarioSeleccionado\nFecha: ${DateFormat('dd/MM/yyyy').format(fechaSeleccionada!)}\n"
          "Litros entregados: $litrosEntregados\nValor a pagar: \$${totalPagar.toStringAsFixed(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.radialGradient,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                // Header con título
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.4),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.fifthColor.withOpacity(0.3),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.fifthColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppColors.fifthColor.withOpacity(0.5),
                                width: 2,
                              ),
                            ),
                            child: Icon(
                              Icons.attach_money_outlined,
                              color: AppColors.fifthColor,
                              size: 32,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            "Módulo de Pagos",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Formulario de liquidación
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.4),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 25,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Datos para Liquidación',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Dropdown de usuarios
                          _GlassmorphicDropdown(
                            value: usuarioSeleccionado,
                            items: usuarios,
                            hint: 'Seleccione un usuario',
                            icon: Icons.person_outline,
                            onChanged: (valor) {
                              setState(() {
                                usuarioSeleccionado = valor;
                              });
                            },
                          ),
                          const SizedBox(height: 20),

                          // Selector de fecha
                          _DatePickerButton(
                            fechaSeleccionada: fechaSeleccionada,
                            onPressed: () => _seleccionarFecha(context),
                          ),
                          const SizedBox(height: 24),

                          _GlassmorphicButton(
                            text: 'Calcular Pago',
                            icon: Icons.calculate_outlined,
                            onPressed: mostrarPagos,
                            isEnabled: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Resultado de pago
                if (mensajePago.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.4),
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green.withOpacity(0.4),
                              blurRadius: 25,
                              spreadRadius: 3,
                            ),
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.receipt_long_outlined,
                                  color: Colors.greenAccent,
                                  size: 40,
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  'Resumen de Pago',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black.withOpacity(0.5),
                                        blurRadius: 8,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.3),
                                  width: 1.5,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    size: 60,
                                    color: Colors.greenAccent,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    mensajePago,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      height: 1.8,
                                      shadows: [
                                        Shadow(
                                          color: Colors.black.withOpacity(0.5),
                                          blurRadius: 4,
                                          offset: const Offset(0, 1),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            _GlassmorphicButton(
                              text: 'Descargar Comprobante',
                              icon: Icons.download_outlined,
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text(
                                      "Comprobante descargado correctamente",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: AppColors.fifthColor,
                                    behavior: SnackBarBehavior.floating,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                );
                              },
                              isEnabled: true,
                            ),
                          ],
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

class _GlassmorphicDropdown extends StatefulWidget {
  final String? value;
  final List<String> items;
  final String hint;
  final IconData icon;
  final Function(String?) onChanged;

  const _GlassmorphicDropdown({
    required this.value,
    required this.items,
    required this.hint,
    required this.icon,
    required this.onChanged,
  });

  @override
  State<_GlassmorphicDropdown> createState() => _GlassmorphicDropdownState();
}

class _GlassmorphicDropdownState extends State<_GlassmorphicDropdown> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        transform: Matrix4.identity()..scale(_isHovered ? 1.01 : 1.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: _isHovered
              ? [
            BoxShadow(
              color: AppColors.fifthColor.withOpacity(0.4),
              blurRadius: 20,
              spreadRadius: 2,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ]
              : [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(_isHovered ? 0.2 : 0.15),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.white.withOpacity(_isHovered ? 0.4 : 0.3),
                  width: 2,
                ),
              ),
              child: DropdownButtonFormField<String>(
                value: widget.value,
                dropdownColor: AppColors.tertiaryColor,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    widget.icon,
                    color: AppColors.fifthColor,
                    size: 24,
                  ),
                  hintText: widget.hint,
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.transparent,
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                ),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  shadows: [
                    Shadow(
                      color: Colors.black38,
                      blurRadius: 4,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.fifthColor,
                ),
                items: widget.items.map((item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: widget.onChanged,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DatePickerButton extends StatefulWidget {
  final DateTime? fechaSeleccionada;
  final VoidCallback onPressed;

  const _DatePickerButton({
    required this.fechaSeleccionada,
    required this.onPressed,
  });

  @override
  State<_DatePickerButton> createState() => _DatePickerButtonState();
}

class _DatePickerButtonState extends State<_DatePickerButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        transform: Matrix4.identity()..scale(_isHovered ? 1.01 : 1.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: _isHovered
              ? [
            BoxShadow(
              color: AppColors.fifthColor.withOpacity(0.4),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ]
              : [],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(_isHovered ? 0.2 : 0.15),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.white.withOpacity(_isHovered ? 0.4 : 0.3),
                  width: 2,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    color: AppColors.fifthColor,
                    size: 24,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fecha de liquidación',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withOpacity(0.8),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.fechaSeleccionada != null
                              ? DateFormat('dd/MM/yyyy')
                              .format(widget.fechaSeleccionada!)
                              : 'Seleccionar fecha',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 4,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: widget.onPressed,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.fifthColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.fifthColor.withOpacity(0.5),
                          width: 2,
                        ),
                      ),
                      child: Icon(
                        Icons.edit_calendar_outlined,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GlassmorphicButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onPressed;
  final bool isEnabled;

  const _GlassmorphicButton({
    required this.text,
    required this.icon,
    required this.onPressed,
    required this.isEnabled,
  });

  @override
  State<_GlassmorphicButton> createState() => _GlassmorphicButtonState();
}

class _GlassmorphicButtonState extends State<_GlassmorphicButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        transform: Matrix4.identity()
          ..scale(_isHovered && widget.isEnabled ? 1.03 : 1.0),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: _isHovered && widget.isEnabled
              ? [
            BoxShadow(
              color: AppColors.fifthColor.withOpacity(0.6),
              blurRadius: 25,
              spreadRadius: 3,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ]
              : [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: widget.isEnabled
                      ? (_isHovered
                      ? [
                    AppColors.fifthColor.withOpacity(0.8),
                    AppColors.fifthColor.withOpacity(0.6),
                  ]
                      : [
                    AppColors.fifthColor.withOpacity(0.7),
                    AppColors.fifthColor.withOpacity(0.5),
                  ])
                      : [
                    Colors.grey.withOpacity(0.5),
                    Colors.grey.withOpacity(0.4),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.white.withOpacity(_isHovered ? 0.5 : 0.3),
                  width: 2,
                ),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  disabledForegroundColor: Colors.white.withOpacity(0.5),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black38,
                        blurRadius: 4,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: widget.onPressed,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(widget.icon, size: 22),
                    const SizedBox(width: 12),
                    Text(widget.text),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}