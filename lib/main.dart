import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:smartmilk/ui/Login/Manager/ProfileUser.dart';
import 'package:smartmilk/ui/Login/User/ProfileUser.dart';
import 'package:smartmilk/utils/Colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        child: Stack(
          children: [
            // Icono de vaca en el fondo con efecto translúcido
            Positioned.fill(
              child: Center(
                child: Opacity(
                  opacity: 0.08,
                  child: FaIcon(
                    FontAwesomeIcons.cow,
                    size: 350,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // Contenido principal
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Iconos multiplataforma con efecto glassmorphic
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _GlassmorphicIconContainer(
                              icon: FontAwesomeIcons.mobile,
                            ),
                            const SizedBox(width: 24),
                            _GlassmorphicIconContainer(
                              icon: FontAwesomeIcons.computer,
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        // Título con efecto glassmorphic mejorado
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 24,
                              ),
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
                                children: [
                                  Text(
                                    'Bienvenido a',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white.withOpacity(0.9),
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'ASOPROGANUCOT',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.fifthColor,
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'Elige tu tipo de usuario',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white.withOpacity(0.8),
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        // Botón Administrador
                        _GlassmorphicButton(
                          text: 'Administrador',
                          icon: Icons.admin_panel_settings_outlined,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AdminPage()),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        // Botón Usuario
                        _GlassmorphicButton(
                          text: 'Usuario',
                          icon: Icons.person_outline,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const UserPage()),
                            );
                          },
                        ),
                      ],
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
}

class _GlassmorphicIconContainer extends StatefulWidget {
  final IconData icon;

  const _GlassmorphicIconContainer({
    required this.icon,
  });

  @override
  State<_GlassmorphicIconContainer> createState() =>
      _GlassmorphicIconContainerState();
}

class _GlassmorphicIconContainerState
    extends State<_GlassmorphicIconContainer> {
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
          borderRadius: BorderRadius.circular(100),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: _isHovered ? 15 : 10,
              sigmaY: _isHovered ? 15 : 10,
            ),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(_isHovered ? 0.15 : 0.1),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white.withOpacity(_isHovered ? 0.3 : 0.2),
                  width: 2,
                ),
                boxShadow: _isHovered
                    ? [
                  BoxShadow(
                    color: AppColors.fifthColor.withOpacity(0.4),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ]
                    : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Icon(
                widget.icon,
                size: 80,
                color: AppColors.fifthColor,
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
  final VoidCallback onPressed;

  const _GlassmorphicButton({
    required this.text,
    required this.icon,
    required this.onPressed,
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
        transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: _isHovered
              ? [
            BoxShadow(
              color: AppColors.fifthColor.withOpacity(0.5),
              blurRadius: 25,
              spreadRadius: 3,
            ),
          ]
              : [
            BoxShadow(
              color: AppColors.fifthColor.withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 6),
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
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: widget.onPressed,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(widget.icon, size: 28),
                    const SizedBox(width: 12),
                    Text(widget.text),
                    const SizedBox(width: 8),
                    AnimatedRotation(
                      turns: _isHovered ? 0.05 : 0.0,
                      duration: const Duration(milliseconds: 300),
                      child: const Icon(Icons.arrow_forward_rounded, size: 24),
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
