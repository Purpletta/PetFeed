import 'package:flutter/material.dart';
import 'package:pet_feed/design/custom_icons.dart';
import 'package:pet_feed/design/colors.dart';
import 'package:pet_feed/app_bar_controller.dart';
import 'package:pet_feed/pet_info.dart';
import 'package:pet_feed/pet_list_widget.dart';
import 'package:pet_feed/settings_page.dart';
import 'package:pet_feed/user.dart';
import 'package:pet_feed/user_provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State {
  int _selectedTab = 1;

  bool _isPetMenuOpen = false;

  final List _pages = [
    const Center(
      child: Text("Pet"),
    ),
    Center(
      child: HomePage(),
    ),
    const Center(child: SettingsPage()),
  ];

  _changeTab(int index) {
    if (index == 0) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return PetsCard();
        },
      );
    } else {
      setState(() {
        _selectedTab = index;
        _isPetMenuOpen = false;
      });
    }
  }

  _closePetMenu() {
    setState(() {
      _isPetMenuOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    UserInfo user = UserProvider.of(context);
    return Stack(children: [
      Scaffold(
        body: _pages[_selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          onTap: (index) => _changeTab(index),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Питомцы'),
            BottomNavigationBarItem(
                icon: Icon(CustomIcons.pawprint), label: 'Главное'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Настройки'),
          ],
          selectedLabelStyle: const TextStyle(
              fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontFamily: 'Montserrat'),
          backgroundColor: bottomNavBarColor,
          unselectedItemColor: textColor,
          selectedItemColor: mainGreenColor,
        ),
      ),
    ]);
  }
}
