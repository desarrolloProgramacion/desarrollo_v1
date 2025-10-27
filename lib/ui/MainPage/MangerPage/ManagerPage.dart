import 'package:flutter/material.dart';
import 'dart:ui';
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
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.radialGradient,
        ),
        child: Row(
          children: [
            if (!isExpanded)
              Container(
                width: 280,
                margin: const EdgeInsets.all(16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Menú',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                _GlassmorphicIconButton(
                                  icon: Icons.menu,
                                  onPressed: () {
                                    setState(() {
                                      showExtraIcons = !showExtraIcons;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          if (showExtraIcons)
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                children: [
                                  _GlassmorphicIconButton(
                                    icon: Icons.settings,
                                    onPressed: () {},
                                  ),
                                  const SizedBox(width: 8),
                                  _GlassmorphicIconButton(
                                    icon: Icons.info,
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                          const SizedBox(height: 16),
                          Expanded(
                            child: SingleChildScrollView(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                children: [
                                  buildButton(
                                    'Agregar un nuevo Usuario',
                                    Icons.person_add_outlined,
                                    const AgregarPage(),
                                  ),
                                  const SizedBox(height: 12),
                                  buildButton(
                                    'Registrar producción láctea',
                                    Icons.agriculture_outlined,
                                    const RegistrarPage(),
                                  ),
                                  const SizedBox(height: 12),
                                  buildButton(
                                    'Mostrar datos usuarios',
                                    Icons.people_outline,
                                    const MostrarPage(),
                                  ),
                                  const SizedBox(height: 12),
                                  buildButton(
                                    'Liquidación de usuarios',
                                    Icons.attach_money_outlined,
                                    const LiquidacionPage(),
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
              ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                    top: 16, right: 16, bottom: 16, left: isExpanded ? 16 : 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          selectedView ??
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.touch_app_outlined,
                                      size: 80,
                                      color: AppColors.fifthColor.withOpacity(0.6),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      'Seleccione una opción del menú',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white.withOpacity(0.8),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          Positioned(
                            bottom: 20,
                            left: 20,
                            child: _GlassmorphicFloatingButton(
                              icon: isExpanded
                                  ? Icons.fullscreen_exit
                                  : Icons.fullscreen,
                              onPressed: () {
                                setState(() {
                                  isExpanded = !isExpanded;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(String text, IconData icon, Widget view) {
    return _GlassmorphicMenuButton(
      text: text,
      icon: icon,
      onPressed: () => changeView(view),
    );
  }
}

class _GlassmorphicIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _GlassmorphicIconButton({
    required this.icon,
    required this.onPressed,
  });

  @override
  State<_GlassmorphicIconButton> createState() =>
      _GlassmorphicIconButtonState();
}

class _GlassmorphicIconButtonState extends State<_GlassmorphicIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        transform: Matrix4.identity()..scale(_isHovered ? 1.1 : 1.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(_isHovered ? 0.2 : 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.white.withOpacity(_isHovered ? 0.3 : 0.2),
                  width: 1.5,
                ),
                boxShadow: _isHovered
                    ? [
                  BoxShadow(
                    color: AppColors.fifthColor.withOpacity(0.4),
                    blurRadius: 15,
                    spreadRadius: 2,
                  ),
                ]
                    : [],
              ),
              child: InkWell(
                onTap: widget.onPressed,
                child: Icon(
                  widget.icon,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GlassmorphicMenuButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const _GlassmorphicMenuButton({
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  State<_GlassmorphicMenuButton> createState() =>
      _GlassmorphicMenuButtonState();
}

class _GlassmorphicMenuButtonState extends State<_GlassmorphicMenuButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        transform: Matrix4.identity()..scale(_isHovered ? 1.02 : 1.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(_isHovered ? 0.2 : 0.12),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.white.withOpacity(_isHovered ? 0.3 : 0.2),
                  width: 1.5,
                ),
                boxShadow: _isHovered
                    ? [
                  BoxShadow(
                    color: AppColors.fifthColor.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ]
                    : [],
              ),
              child: ElevatedButton(
                onPressed: widget.onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(widget.icon, size: 24),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        widget.text,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    AnimatedRotation(
                      turns: _isHovered ? 0.05 : 0.0,
                      duration: const Duration(milliseconds: 300),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16,
                        color: Colors.white.withOpacity(0.7),
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

class _GlassmorphicFloatingButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _GlassmorphicFloatingButton({
    required this.icon,
    required this.onPressed,
  });

  @override
  State<_GlassmorphicFloatingButton> createState() =>
      _GlassmorphicFloatingButtonState();
}

class _GlassmorphicFloatingButtonState
    extends State<_GlassmorphicFloatingButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        transform: Matrix4.identity()..scale(_isHovered ? 1.15 : 1.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: _isHovered
                      ? [
                    AppColors.fifthColor.withOpacity(0.7),
                    AppColors.fifthColor.withOpacity(0.5),
                  ]
                      : [
                    AppColors.fifthColor.withOpacity(0.6),
                    AppColors.fifthColor.withOpacity(0.4),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.white.withOpacity(_isHovered ? 0.3 : 0.2),
                  width: 1.5,
                ),
                boxShadow: _isHovered
                    ? [
                  BoxShadow(
                    color: AppColors.fifthColor.withOpacity(0.5),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ]
                    : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: widget.onPressed,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(
                      widget.icon,
                      color: Colors.white,
                      size: 28,
                    ),
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