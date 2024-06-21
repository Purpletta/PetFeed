import 'package:flutter/material.dart';
import 'package:pet_feed/advice_page.dart';
import 'package:pet_feed/design/custom_icons.dart';
import 'package:pet_feed/design/colors.dart';
import 'package:pet_feed/food/food_page.dart';
import 'package:pet_feed/pet_info.dart';
import 'package:pet_feed/profile_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'PetFeed',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: mainWhiteColor, fontSize: 25, fontFamily: 'Aclonica'),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  mainYellowColor,
                  mainGreenColor,
                ],
              ),
            ),
          ),
          bottom: const TabBar(
            labelColor: mainWhiteColor,
            unselectedLabelColor: textColor,
            indicatorColor: textColor,
            labelStyle: TextStyle(
                fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
            tabs: [
              Tab(
                text: "Питомец",
              ),
              Tab(
                text: "Еда",
              ),
              Tab(
                text: "Советы",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [ProfilePage(), FoodPage(), AdvicePage()],
        ),
      ),
    );
  }
}
