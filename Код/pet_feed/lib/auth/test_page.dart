// import 'package:flutter/material.dart';
// import 'package:pet_feed/custom_icons.dart';
// import 'package:pet_feed/design/colors.dart';
// import 'package:pet_feed/app_bar_controller.dart';
// import 'package:pet_feed/pet_list_widget.dart';
// import 'package:pet_feed/settings_page.dart';
//  // импорт файла с классом PetsCard

// class BottomNavBar extends StatefulWidget {
//   const BottomNavBar({super.key});

//   @override
//   _BottomNavBarState createState() => _BottomNavBarState();
// }

// class _BottomNavBarState extends State<BottomNavBar> {
//   int _selectedTab = 1;

//   bool _isPetMenuOpen = false;

//   final List<String> _petNames = ['Барсик', 'Мурзик', 'Пушок'];

//   void _showPetDialog(int index) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Удаление питомца'),
//           content: const Text('Вы уверены, что хотите удалить питомца?'),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('Нет'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: const Text('Да'),
//               onPressed: () {
//                 setState(() {
//                   _petNames.removeAt(index);
//                 });
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Pet Feed'),
//         centerTitle: true,
//         backgroundColor: mainGreenColor,
//       ),
//       body: _pages[_selectedTab],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedTab,
//         onTap: (index) {
//           if (index == 0) {
//             _isPetMenuOpen = !_isPetMenuOpen;
//           } else {
//             setState(() {
//               _selectedTab = index;
//             });
//           }
//         },
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Питомцы'),
//           BottomNavigationBarItem(
//               icon: Icon(CustomIcons.pawprint), label: 'Главное'),
//           BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Настройки'),
//         ],
//         selectedLabelStyle: const TextStyle(
//             fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
//         unselectedLabelStyle: const TextStyle(fontFamily: 'Montserrat'),
//         backgroundColor: bottomNavBarColor,
//         unselectedItemColor: textColor,
//         selectedItemColor: mainGreenColor,
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // TODO: реализовать добавление питомца
//         },
//         child: const Icon(Icons.add),
//         backgroundColor: mainGreenColor,
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       endDrawer: const AppBarController(),
//       // добавление меню питомцев
//       bottomSheet: _isPetMenuOpen
//           ? Container(
//               height: 200,
//               color: bottomNavBarColor,
//               child: ListView.builder(
//                 itemCount: _petNames.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return PetsCard(
//                     petName: _petNames[index],
//                     onDelete: () => _showPetDialog(index),
//                   );
//                 },
//               ),
//             )
//           : null,
//     );
//   }
// }
