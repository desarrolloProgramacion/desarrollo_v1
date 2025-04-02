import 'package:flutter/material.dart';
import '../../../../utils/Colors.dart';
import 'NavigationBar/HomeUserPage.dart';
import 'NavigationBar/PaymentsPage.dart';
import 'NavigationBar/ProfilePage.dart';
import 'NavigationBar/StatisticsPage.dart';


class UserMain extends StatefulWidget {
  const UserMain({super.key});

  @override
  _UserMainState createState() => _UserMainState();
}

class _UserMainState extends State<UserMain> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomeUserPage(),
    const StatisticsPage(),
     PaymentsPage(),
     ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: AppColors.tertiaryColor,
        unselectedItemColor: Colors.white,
        backgroundColor: AppColors.fifthColor,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Estadísticas"),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: "Pagos"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
      ),
    );
  }
}
