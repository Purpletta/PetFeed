import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_feed/auth/activity_page.dart';
import 'package:pet_feed/auth/auth_app_bar.dart';
import 'package:pet_feed/auth/gender_page.dart';
import 'package:pet_feed/auth/name_page.dart';
import 'package:pet_feed/auth/reg_page_1.dart';
import 'package:pet_feed/auth/spiese_page.dart';
import 'package:pet_feed/bottom_nav_bar.dart';
import 'package:pet_feed/design/colors.dart';
import 'package:pet_feed/user.dart';
import 'package:pet_feed/user_provider.dart';
import 'package:talker/talker.dart';

class BirthDatePage extends StatefulWidget {
  final String pet_name;
  const BirthDatePage({super.key, required this.pet_name});

  @override
  _BirthDatePageState createState() => _BirthDatePageState();
}

class _BirthDatePageState extends State<BirthDatePage> {
  final dateController = TextEditingController();

  int date = 0;
  final talker = Talker();

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
                // ШАПКА
                AuthAppBar(),
                const SizedBox(height: 50),

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
                                    GenderPage(pet_name: widget.pet_name)),
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
                const SizedBox(height: 16),

                // ЗАГОЛОВОК
                const Text(
                  'Дата рождения питомца',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: mainWhiteColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),

                const SizedBox(height: 16),

                // виджет выбора даты

                TextField(
                    controller: dateController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.calendar_month_rounded),
                      filled: true, // закрашивает поле ввода
                      fillColor: Colors.white, // цвет заливки
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    readOnly: true,
                    onTap: () {
                      _selectDate();
                    }),

                const SizedBox(height: 50),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300, // задаем ширину контейнера
                      height: 100, // задаем высоту контейнера
                      child: const Padding(
                        padding: EdgeInsets.all(
                            8.0), // задаем отступ текста от границ контейнера
                        child: Text(
                          'Если вы не знаете точный день и месяц, укажите 15 июня', // задаем текст
                          style: TextStyle(
                              color: mainWhiteColor, // цвет текста
                              fontSize: 16,
                              fontFamily: 'Montserrat'), // задаем стиль текста
                          textAlign:
                              TextAlign.center, // выравниваем текст по центру
                        ),
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 50),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          user.findPetByName(widget.pet_name)!.age = date;
                          talker.debug(user.toString());
                        });
                        if (dateController.text != "") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ActivityPage(pet_name: widget.pet_name)),
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

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime.now());
    if (picked != null) {
      setState(() {
        date = (DateTime.now().difference(picked).inDays / 365.25).round();
        dateController.text = picked.toString().split(" ")[0];
      });
    }
  }
}
