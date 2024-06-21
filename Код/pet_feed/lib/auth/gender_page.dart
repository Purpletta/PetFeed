import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_feed/auth/birthDate_page.dart';
import 'package:pet_feed/auth/name_page.dart';
import 'package:pet_feed/auth/petname_page.dart';
import 'package:pet_feed/bottom_nav_bar.dart';
import 'package:pet_feed/design/colors.dart';
import 'package:pet_feed/pet_info.dart';
import 'package:pet_feed/user.dart';
import 'package:pet_feed/user_provider.dart';
import 'package:talker/talker.dart';
import 'reg_page_1.dart';

class GenderPage extends StatefulWidget {
  final String pet_name;
  const GenderPage({super.key, required this.pet_name});

  @override
  _GenderPageState createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  Talker talker = Talker();
  String gender = '';
  bool isBoyPressed = false;
  bool isGirlPressed = false;

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
                                builder: (context) => PetNamePage()),
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
                const SizedBox(height: 30),

                // кнопка кошка
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      gender = "Мальчик";
                      isBoyPressed = true;
                      isGirlPressed = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainWhiteColor, // цвет фона кнопки
                    shape: RoundedRectangleBorder(
                      // закругление краев
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                          color: isBoyPressed
                              ? textColor
                              : mainWhiteColor, // цвет границы
                          width: 2),
                    ),
                    fixedSize: Size(350, 100),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('assets/img/boy.png'),
                          fit: BoxFit.contain,
                          alignment: Alignment.topRight),
                      borderRadius: BorderRadius.circular(
                          10), // закругление краев контейнера
                    ),
                    child: const Center(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Text(
                            'Мальчик',
                            style: TextStyle(
                              color: textColor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                //кнопка собака
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      gender = "Девочка";
                      isBoyPressed = false;
                      isGirlPressed = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: mainWhiteColor, // цвет фона кнопки
                      shape: RoundedRectangleBorder(
                          // закругление краев
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                              color: isGirlPressed
                                  ? textColor
                                  : mainWhiteColor, // цвет границы
                              width: 2)),
                      fixedSize: Size(350, 100)),
                  child: Container(
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('assets/img/girl.png'),
                          fit: BoxFit.contain,
                          alignment: Alignment.topLeft),
                      borderRadius: BorderRadius.circular(10),
                      // закругление краев контейнера
                    ),
                    child: const Center(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Text(
                            'Девочка',
                            style: TextStyle(
                              color: textColor,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ),
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
                          user.findPetByName(widget.pet_name)!.gender = gender;
                        });
                        talker.debug(user.toString());
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  BirthDatePage(pet_name: widget.pet_name)),
                        );
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
