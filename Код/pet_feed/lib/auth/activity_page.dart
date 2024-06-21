import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_feed/auth/birthDate_page.dart';
import 'package:pet_feed/auth/weight_page.dart';
import 'package:pet_feed/design/colors.dart';
import 'package:pet_feed/main.dart';
import 'package:pet_feed/user.dart';
import 'package:pet_feed/user_provider.dart';

class ActivityPage extends StatefulWidget {
  final String pet_name;
  const ActivityPage({super.key, required this.pet_name});

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  String _activity = 'Средняя';

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

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ЛОГО
                SvgPicture.asset(
                  'assets/img/logo_Icon.svg',
                  color: mainWhiteColor, // укажите правильный путь к файлу
                  width: 50,
                  height: 50,
                ),
                const Text(
                  'PetFeed',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: mainWhiteColor,
                      fontSize: 40,
                      fontFamily: 'Aclonica'),
                ),

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
                                builder: (context) => BirthDatePage(
                                      pet_name: widget.pet_name,
                                    )),
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
                  'Уровень активности',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: mainWhiteColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),

                const SizedBox(height: 16),

                // поле выбора активности
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: mainWhiteColor),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Radio<String>(
                              value: 'Высокая',
                              groupValue: _activity,
                              activeColor: textColor,
                              onChanged: (value) {
                                setState(() {
                                  _activity = value!;
                                });
                              },
                            ),
                            const Text(
                              'Высокая',
                              style: TextStyle(
                                  color: textColor,
                                  fontSize: 20,
                                  fontFamily: 'Montserrat'),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio<String>(
                              value: 'Средняя',
                              groupValue: _activity,
                              activeColor: textColor,
                              onChanged: (value) {
                                setState(() {
                                  _activity = value!;
                                });
                              },
                            ),
                            const Text('Средняя',
                                style: TextStyle(
                                    color: textColor,
                                    fontSize: 20,
                                    fontFamily: 'Montserrat')),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          user.findPetByName(widget.pet_name)!.activity =
                              _activity;
                        });
                        talker.debug(user.toString());
                        if (_activity != '') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WeightPage(
                                      pet_name: widget.pet_name,
                                    )),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: textColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      // fixedSize: const Size(350, 30)),
                      child: const Text(
                        'Далее',
                        style: TextStyle(
                            color: mainWhiteColor, // цвет текста
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
        ],
      ),
    );
  }
}
