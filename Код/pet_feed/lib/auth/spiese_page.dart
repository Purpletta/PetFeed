import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_feed/auth/gender_page.dart';
import 'package:pet_feed/auth/petname_page.dart';
import 'package:pet_feed/design/colors.dart';
import 'package:pet_feed/pet_info.dart';
import 'package:pet_feed/user.dart';
import 'package:pet_feed/user_provider.dart';
import 'package:talker/talker.dart';

class SpiecePage extends StatefulWidget {
  final String pet_name;
  const SpiecePage({super.key, required this.pet_name});

  @override
  _SpiecePageState createState() => _SpiecePageState();
}

class _SpiecePageState extends State<SpiecePage> {
  String _animal = '';
  bool isCatPressed = false;
  bool isDogPressed = false;
  Talker talker = Talker();

  void _selectAnimal(String animal) {
    setState(() {
      _animal = animal;
    });
  }

  @override
  Widget build(BuildContext context) {
    UserInfo user = UserProvider.of(context);
    PetInfo? pet = user.findPetByName(widget.pet_name);
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
                      _animal = "Кошка";
                      isCatPressed = true;
                      isDogPressed = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainWhiteColor, // цвет фона кнопки
                    shape: RoundedRectangleBorder(
                      // закругление краев
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                          color: isCatPressed
                              ? textColor
                              : mainWhiteColor, // цвет границы
                          width: 2),
                    ),
                    fixedSize: Size(350, 100),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('assets/img/cat.png'),
                          fit: BoxFit.contain,
                          alignment: Alignment(1, -0.4)),
                      borderRadius: BorderRadius.circular(
                          10), // закругление краев контейнера
                    ),
                    child: const Center(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Text(
                            'У меня кошка',
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
                      _animal = "Собака";
                      isCatPressed = false;
                      isDogPressed = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: mainWhiteColor, // цвет фона кнопки
                      shape: RoundedRectangleBorder(
                          // закругление краев
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                              color: isDogPressed
                                  ? textColor
                                  : mainWhiteColor, // цвет границы
                              width: 2)),
                      fixedSize: Size(350, 100)),
                  child: Container(
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('assets/img/dog.png'),
                          fit: BoxFit.contain,
                          alignment: Alignment(-1, -0.4)),
                      borderRadius: BorderRadius.circular(10),
                      // закругление краев контейнера
                    ),
                    child: const Center(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Text(
                            'У меня собака',
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

                const SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (pet != null) {
                          setState(() {
                            user.findPetByName(widget.pet_name)!.species =
                                _animal;
                          });
                        }
                        talker.debug(user.toString());
                        if (pet != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    GenderPage(pet_name: pet.name)),
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
