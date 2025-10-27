import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../utils/Colors.dart';

class AgregarPage extends StatefulWidget {
  const AgregarPage({super.key});

  @override
  _AgregarPageState createState() => _AgregarPageState();
}

class _AgregarPageState extends State<AgregarPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _userCodeController = TextEditingController();
  final TextEditingController _cedulaController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();

  bool _isQrGenerated = false;
  String? _qrData;

  void _agregarUsuario() {
    if (_formKey.currentState!.validate()) {
      String nombre = _nameController.text;
      String codigoUsuario = _userCodeController.text;
      String cedula = _cedulaController.text;
      String telefono = _telefonoController.text;

      // Aquí puedes manejar la lógica para guardar el usuario
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Usuario $nombre (Código: $codigoUsuario, Cédula: $cedula, Teléfono: $telefono) agregado con éxito!',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: AppColors.fifthColor,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );

      // Limpia los campos después de agregar
      _nameController.clear();
      _userCodeController.clear();
      _cedulaController.clear();
      _telefonoController.clear();

      setState(() {
        _isQrGenerated = false;
        _qrData = null;
      });
    }
  }

  void _generarQR() {
    String nombre = _nameController.text;
    String codigoUsuario = _userCodeController.text;
    String cedula = _cedulaController.text;
    String telefono = _telefonoController.text;

    setState(() {
      _qrData =
      'Nombre: $nombre\nCódigo Usuario: $codigoUsuario\nCédula: $cedula\nTeléfono: $telefono';
      _isQrGenerated = true;
    });
  }

  bool _todosCamposLlenos() {
    return _nameController.text.isNotEmpty &&
        _userCodeController.text.isNotEmpty &&
        _cedulaController.text.isNotEmpty &&
        _telefonoController.text.isNotEmpty;
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
                              Icons.person_add_outlined,
                              color: AppColors.fifthColor,
                              size: 32,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            "Agregar Usuario",
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
                // Formulario
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
                          BoxShadow(
                            color: AppColors.fifthColor.withOpacity(0.1),
                            blurRadius: 20,
                            spreadRadius: -5,
                          ),
                        ],
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _GlassmorphicTextField(
                              controller: _nameController,
                              labelText: "Nombre",
                              icon: Icons.person_outline,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Por favor ingrese el nombre";
                                }
                                return null;
                              },
                              onChanged: (value) => setState(() {}),
                            ),
                            const SizedBox(height: 16),
                            _GlassmorphicTextField(
                              controller: _userCodeController,
                              labelText: "Código Usuario",
                              icon: Icons.badge_outlined,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Ingrese un código de usuario";
                                }
                                if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                                  return "El código debe ser numérico";
                                }
                                return null;
                              },
                              onChanged: (value) => setState(() {}),
                            ),
                            const SizedBox(height: 16),
                            _GlassmorphicTextField(
                              controller: _cedulaController,
                              labelText: "Cédula",
                              icon: Icons.credit_card_outlined,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Ingrese la cédula";
                                }
                                if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                                  return "La cédula debe ser numérica";
                                }
                                return null;
                              },
                              onChanged: (value) => setState(() {}),
                            ),
                            const SizedBox(height: 16),
                            _GlassmorphicTextField(
                              controller: _telefonoController,
                              labelText: "Teléfono",
                              icon: Icons.phone_outlined,
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Ingrese el teléfono";
                                }
                                if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                                  return "El teléfono debe ser numérico";
                                }
                                return null;
                              },
                              onChanged: (value) => setState(() {}),
                            ),
                            const SizedBox(height: 24),
                            Row(
                              children: [
                                Expanded(
                                  child: _GlassmorphicButton(
                                    text: "Agregar",
                                    icon: Icons.add_circle_outline,
                                    onPressed: _agregarUsuario,
                                    isEnabled: true,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: _GlassmorphicButton(
                                    text: "Generar QR",
                                    icon: Icons.qr_code_2_outlined,
                                    onPressed: _todosCamposLlenos()
                                        ? _generarQR
                                        : null,
                                    isEnabled: _todosCamposLlenos(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // QR Code
                if (_isQrGenerated && _qrData != null && _qrData!.isNotEmpty)
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
                              color: AppColors.fifthColor.withOpacity(0.4),
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
                            Text(
                              "Código QR Generado",
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
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.fifthColor.withOpacity(0.3),
                                    blurRadius: 15,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: QrImageView(
                                data: _qrData ?? '',
                                version: QrVersions.auto,
                                size: 200.0,
                              ),
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
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  const _GlassmorphicTextField({
    required this.controller,
    required this.labelText,
    required this.icon,
    this.keyboardType,
    this.validator,
    this.onChanged,
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
                child: TextFormField(
                  controller: widget.controller,
                  keyboardType: widget.keyboardType,
                  validator: widget.validator,
                  onChanged: widget.onChanged,
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
                    errorStyle: TextStyle(
                      color: Colors.red[200],
                      fontSize: 12,
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
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Colors.red.withOpacity(0.6),
                        width: 2,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Colors.red.withOpacity(0.8),
                        width: 2,
                      ),
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
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        widget.text,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
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