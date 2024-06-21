import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_feed/auth/activity_page.dart';
import 'package:pet_feed/auth/auth_app_bar.dart';
import 'package:pet_feed/auth/birthDate_page.dart';
import 'package:pet_feed/auth/feed_page.dart';
import 'package:pet_feed/auth/weight_page.dart';
import 'package:pet_feed/design/colors.dart';
import 'package:pet_feed/main.dart';
import 'package:pet_feed/user.dart';
import 'package:pet_feed/user_provider.dart';

class HealthPage extends StatefulWidget {
  final String pet_name;
  const HealthPage({super.key, required this.pet_name});

  @override
  _HealthPageState createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  TextStyle textStyle = const TextStyle(
      color: textColor, // цвет текста
      fontSize: 16,
      fontFamily: 'Montserrat');

  bool sterilization = false;
  bool pregnancy = false;
  bool allergies = false;
  bool gastrointestinal_diseases = false;
  bool urinary_diseases = false;
  bool kidney_diseases = false;
  bool diabet = false;
  bool obesity = false;
  bool skin_diseases = false;
  bool liver_diseases = false;

  String dis = "";

  @override
  Widget build(BuildContext context) {
    UserInfo user = UserProvider.of(context);
    return Scaffold(
      body: Stack(
        children: [
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ЛОГО
                  AuthAppBar(),

                  const SizedBox(height: 10),

                  // НАЗАД
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      WeightPage(pet_name: widget.pet_name)),
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

                  // ЗАГОЛОВОК
                  const Text(
                    'Отметьте особенности здоровья питомца',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: mainWhiteColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'),
                  ),

                  const SizedBox(height: 16),
                  // поле выбора активности
                  SingleChildScrollView(
                    child: Card(
                      child: Column(
                        children: [
                          SwitchListTile(
                            title: Text(
                              'Стерилизация',
                              style: textStyle,
                            ),
                            value: sterilization,
                            onChanged: (value) {
                              setState(() {
                                sterilization = value;
                                if (value) {
                                  dis += 'Стерилизация ';
                                } else {
                                  dis = dis.replaceAll('Стерилизация ', '');
                                }
                              });
                            },
                            activeColor: textColor,
                          ),
                          SwitchListTile(
                            title: Text(
                              'Беременность',
                              style: textStyle,
                            ),
                            value: pregnancy,
                            onChanged: (value) {
                              setState(() {
                                pregnancy = value;
                                if (value) {
                                  dis += 'Беременность ';
                                } else {
                                  dis = dis.replaceAll('Беременность ', '');
                                }
                              });
                            },
                            activeColor: textColor,
                          ),
                          SwitchListTile(
                            title: Text(
                              'Аллергии',
                              style: textStyle,
                            ),
                            value: allergies,
                            onChanged: (value) {
                              setState(() {
                                allergies = value;
                                if (value) {
                                  dis += 'Аллергия ';
                                } else {
                                  dis = dis.replaceAll('Аллергия ', '');
                                }
                              });
                            },
                            activeColor: textColor,
                          ),
                          SwitchListTile(
                            title: Text(
                              'Чувствительный ЖКТ',
                              style: textStyle,
                            ),
                            value: gastrointestinal_diseases,
                            onChanged: (value) {
                              setState(() {
                                gastrointestinal_diseases = value;
                                if (value) {
                                  dis += 'Чувствительный ЖКТ ';
                                } else {
                                  dis.replaceAll('Чувствительный ЖКТ ', '');
                                }
                              });
                            },
                            activeColor: textColor,
                          ),
                          SwitchListTile(
                            title: Text(
                              'Болезни мочевыделительной системы',
                              style: textStyle,
                            ),
                            value: urinary_diseases,
                            onChanged: (value) {
                              setState(() {
                                urinary_diseases = value;
                                if (value) {
                                  dis += 'Болезни мочевыделительной системы ';
                                } else {
                                  dis.replaceAll(
                                      'Болезни мочевыделительной системы ', '');
                                }
                              });
                            },
                            activeColor: textColor,
                          ),
                          SwitchListTile(
                            title: Text(
                              'Болезни почек',
                              style: textStyle,
                            ),
                            value: kidney_diseases,
                            onChanged: (value) {
                              setState(() {
                                kidney_diseases = value;
                                if (value) {
                                  dis += 'Болезни почек ';
                                } else {
                                  dis.replaceAll('Болезни почек ', '');
                                }
                              });
                            },
                            activeColor: textColor,
                          ),
                          SwitchListTile(
                            title: Text(
                              'Диабет',
                              style: textStyle,
                            ),
                            value: diabet,
                            onChanged: (value) {
                              setState(() {
                                diabet = value;
                                if (value) {
                                  dis += 'Диабет ';
                                } else {
                                  dis.replaceAll('Диабет ', '');
                                }
                              });
                            },
                            activeColor: textColor,
                          ),
                          SwitchListTile(
                            title: Text(
                              'Ожирение',
                              style: textStyle,
                            ),
                            value: obesity,
                            onChanged: (value) {
                              setState(() {
                                obesity = value;
                                if (value) {
                                  dis += 'Ожирение ';
                                } else {
                                  dis.replaceAll('Ожирение ', '');
                                }
                              });
                            },
                            activeColor: textColor,
                          ),
                          SwitchListTile(
                            title: Text(
                              'Проблемы с кожей и шерстью',
                              style: textStyle,
                            ),
                            value: skin_diseases,
                            onChanged: (value) {
                              setState(() {
                                skin_diseases = value;
                                if (value) {
                                  dis += 'Проблемы с кожей и шерстью ';
                                } else {
                                  dis.replaceAll(
                                      'Проблемы с кожей и шерстью ', '');
                                }
                              });
                            },
                            activeColor: textColor,
                          ),
                          SwitchListTile(
                            title: Text(
                              'Проблемы с печенью',
                              style: textStyle,
                            ),
                            value: liver_diseases,
                            onChanged: (value) {
                              setState(() {
                                liver_diseases = value;
                                if (value) {
                                  dis += 'Проблемы с печенью ';
                                } else {
                                  dis.replaceAll('Проблемы с печенью ', '');
                                }
                              });
                            },
                            activeColor: textColor,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            user.findPetByName(widget.pet_name)!.diseases = dis;
                          });
                          talker.debug(user.toString());
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    FeedPage(pet_name: widget.pet_name)),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: textColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          'Далее',
                          style: TextStyle(
                              color: mainWhiteColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
