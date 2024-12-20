import 'package:flutter/material.dart';
import 'package:transport_app/screens/choose_mean_screen.dart';
import 'package:transport_app/screens/logout_screen.dart';

import 'package:transport_app/screens/profile_screen.dart';

class BottomNavbar extends StatefulWidget {
  static const routeName = '/BottomNavbar';
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const ChooseMeanScreen(),
    const ProfileScreen(),
    const LogoutScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.train),
            label: 'Tranport',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: ' Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
        selectedItemColor: const Color.fromARGB(255, 10, 51, 85),
        unselectedItemColor: Colors.grey.shade600,
        backgroundColor: Colors.white,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
