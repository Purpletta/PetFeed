import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pet_feed/auth/auth_app_bar.dart';
import 'package:pet_feed/auth/health_page.dart';
import 'package:pet_feed/auth/login_page.dart';
import 'package:pet_feed/bottom_nav_bar.dart';
import 'package:pet_feed/design/colors.dart';
import 'package:pet_feed/food/food_page.dart';
import 'package:pet_feed/profile_page.dart';
import 'package:pet_feed/user.dart';
import 'package:pet_feed/user_provider.dart';

class FeedPage extends StatefulWidget {
  final String pet_name;
  const FeedPage({super.key, required this.pet_name});

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  String _feed = 'Пока не выбрали';
  final textInFormFieldStyle = TextStyle(
      color: textColor.withOpacity(0.9),
      fontSize: 15,
      fontFamily: 'Montserrat');
  final TextEditingController _searchController = TextEditingController();
  final List<String> _items = [
    'Корм 1',
    'Корм 2',
    'Корм 3',
    'Корм 4',
    'Корм 5',
    'Корм 6',
    'Корм 7',
    'Корм 8',
    'Корм 9',
    'Корм 10',
  ];
  List<String> _filteredItems = [];
  @override
  void initState() {
    super.initState();
    _filteredItems = _items;
  }

  @override
  Widget build(BuildContext context) {
    UserInfo user = UserProvider.of(context);
    String myFeed = user.findPetByName(widget.pet_name)!.feed;
    return Scaffold(
        body: Stack(children: [
      // изображение на фоне
      Positioned.fill(
        child: Image.asset(
          'assets/img/background.png',
          fit: BoxFit.cover,
        ),
      ),

      ListView(children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              AuthAppBar(),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  HealthPage(pet_name: widget.pet_name)),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainWhiteColor.withOpacity(0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: mainWhiteColor,
                      )),
                ],
              ),
              const Text(
                'Выберите основной корм',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: mainWhiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat'),
              ),
              Text(
                'Выбранный корм: $myFeed',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: mainWhiteColor,
                    fontSize: 15,
                    fontFamily: 'Montserrat'),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {
                      _filteredItems = _items
                          .where((item) =>
                              item.toLowerCase().contains(value.toLowerCase()))
                          .toList();
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Введите название корма',
                    hintStyle: textInFormFieldStyle,
                    prefixIcon: const Icon(Icons.search),
                    labelText: 'Поиск',
                    labelStyle: textInFormFieldStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 400,
                child: GridView.count(
                  crossAxisCount: 2,
                  children: _filteredItems.map((item) {
                    return Card(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            myFeed = item;
                            user.findPetByName(widget.pet_name)!.feed = myFeed;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/img/cat.png'),
                            Text(item),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        )
      ]),
      Positioned(
        top: 700,
        left: 230,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  user.findPetByName(widget.pet_name)!.feed = myFeed;
                });
                if (user.findPetByName(widget.pet_name)!.feed !=
                    'Пока не выбран') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BottomNavBar()),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: textColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Завершить',
                style: TextStyle(
                    color: mainWhiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat'),
              ),
            ),
          ],
        ),
      )
    ]));
  }
}
