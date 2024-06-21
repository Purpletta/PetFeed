import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pet_feed/design/colors.dart';

class AdvicePage extends StatefulWidget {
  @override
  _AdvicePageState createState() => _AdvicePageState();
}

class _AdvicePageState extends State<AdvicePage> {
  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      'Как приучить котенка к лотку?',
      'Переезд с питомцем',
      'Стоит ли стерилизовать кошку?',
      'Стричь ли когти?',
      'Как подобрать корм?',
      'Можно ли котам молоко?',
      'Уход за пожилым любимцем',
      'Статья 8',
      'Статья 9',
      'Статья 10',
    ];
    const pageCardStyle = TextStyle(
        fontFamily: 'Montserrat', fontSize: 15, color: mainWhiteColor);

    final List<Color> cardColors = [
      Colors.black.withOpacity(0.5),
      mainYellowColor,
      mainGreenColor,
      Color(0xFFD6B485),
    ];

    return ListView.builder(
      itemCount: titles.length,
      itemBuilder: (BuildContext context, int index) {
        final color = cardColors[index % cardColors.length];
        return Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              height: 150,
              width: 350,
              child: Card(
                  color: color,
                  child: Center(
                    child: Text(
                      titles[index],
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )),
            ));
      },
    );
  }
}
