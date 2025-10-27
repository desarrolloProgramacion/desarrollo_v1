import 'package:flutter/material.dart';
import 'dart:ui';
import '../../../../utils/Colors.dart';

class RegistrarPage extends StatefulWidget {
  const RegistrarPage({super.key});

  @override
  _RegistrarPageState createState() => _RegistrarPageState();
}

class _RegistrarPageState extends State<RegistrarPage> {
  final TextEditingController codigoController = TextEditingController();
  final TextEditingController litrosController = TextEditingController();
  String mensajeConfirmacion = '';

  void confirmarRecepcion() {
    if (codigoController.text.isNotEmpty && litrosController.text.isNotEmpty) {
      setState(() {
        mensajeConfirmacion =
        "Recepción confirmada\nCódigo: ${codigoController.text}\nLitros: ${litrosController.text}";
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Registro exitoso: ${litrosController.text} litros',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: AppColors.fifthColor,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
    }
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
                              Icons.agriculture_outlined,
                              color: AppColors.fifthColor,
                              size: 32,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              "Registro de Entrega de Leche",
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Sección de escaneo QR
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: const EdgeInsets.all(32),
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
                        children: [
                          Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: AppColors.fifthColor.withOpacity(0.15),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.fifthColor.withOpacity(0.5),
                                width: 3,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.fifthColor.withOpacity(0.3),
                                  blurRadius: 20,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.qr_code_scanner,
                              size: 80,
                              color: AppColors.fifthColor,
                            ),
                          ),
                          const SizedBox(height: 24),
                          _GlassmorphicButton(
                            text: 'Escanear QR',
                            icon: Icons.qr_code_scanner_outlined,
                            onPressed: () {
                              // Aquí puedes agregar la lógica para escanear QR
                            },
                            isEnabled: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Formulario de ingreso manual
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
                            'Ingreso Manual',
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
                          _GlassmorphicTextField(
                            controller: codigoController,
                            labelText: "Código de Usuario",
                            icon: Icons.badge_outlined,
                          ),
                          const SizedBox(height: 16),
                          _GlassmorphicTextField(
                            controller: litrosController,
                            labelText: "Litros Entregados",
                            icon: Icons.water_drop_outlined,
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 24),
                          _GlassmorphicButton(
                            text: 'Confirmar Recepción',
                            icon: Icons.check_circle_outline,
                            onPressed: confirmarRecepcion,
                            isEnabled: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Mensaje de confirmación
                if (mensajeConfirmacion.isNotEmpty)
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
                            Icon(
                              Icons.check_circle,
                              size: 60,
                              color: Colors.greenAccent,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              mensajeConfirmacion,
                              style: TextStyle(
                                fontSize: 18,
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
                              textAlign: TextAlign.center,
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

class _GlassmorphicTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  final TextInputType? keyboardType;

  const _GlassmorphicTextField({
    required this.controller,
    required this.labelText,
    required this.icon,
    this.keyboardType,
  });

  @override
  State<_GlassmorphicTextField> createState() => _GlassmorphicTextFieldState();
}

class _GlassmorphicTextFieldState extends State<_GlassmorphicTextField> {
  bool _isHovered = false;
  bool _isFocused = false;

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
          boxShadow: _isHovered || _isFocused
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
                  color: _isFocused
                      ? AppColors.fifthColor.withOpacity(0.6)
                      : Colors.white.withOpacity(_isHovered ? 0.4 : 0.3),
                  width: 2,
                ),
              ),
              child: Focus(
                onFocusChange: (hasFocus) {
                  setState(() {
                    _isFocused = hasFocus;
                  });
                },
                child: TextField(
                  controller: widget.controller,
                  keyboardType: widget.keyboardType,
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
                  decoration: InputDecoration(
                    labelText: widget.labelText,
                    labelStyle: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    prefixIcon: Icon(
                      widget.icon,
                      color: AppColors.fifthColor,
                      size: 24,
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
                ),
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
