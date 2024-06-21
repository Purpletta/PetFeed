import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_feed/auth/auth_app_bar.dart';
import 'package:pet_feed/auth/name_page.dart';
import 'package:pet_feed/auth/spiese_page.dart';
import 'package:pet_feed/design/colors.dart';
import 'package:pet_feed/pet_info.dart';
import 'package:pet_feed/user.dart';
import 'package:pet_feed/user_provider.dart';
import 'package:talker/talker.dart';

class PetNamePage extends StatefulWidget {
  const PetNamePage({super.key});

  @override
  _PetNamePageState createState() => _PetNamePageState();
}

class _PetNamePageState extends State<PetNamePage> {
  final nameController = TextEditingController();
  PetInfo pet = PetInfo(
      name: "name",
      species: "Кошка",
      gender: "gender",
      age: 0,
      weight: 0.0,
      sterilization: false,
      activity: "Средняя",
      diseases: "Нет",
      isActive: true);

  Talker talker = Talker();

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

          // форма для ввода имени
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ЛОГО
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
                            MaterialPageRoute(builder: (context) => NamePage()),
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
                  'Кличка питомца',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: mainWhiteColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),

                const SizedBox(height: 16),

                // поле ввода имени
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    filled: true, // закрашивает поле ввода
                    fillColor: Colors.white, // цвет заливки
                    hintText: 'Введите кличку', // подсказка
                    hintStyle: TextStyle(
                        color: textColor.withOpacity(0.9),
                        fontSize: 15,
                        fontFamily: 'Montserrat'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 300),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (user.isPetUnique(nameController.text)) {
                          setState(() {
                            pet.name = nameController.text;
                            user.addPet(pet);
                          });
                        }
                        talker.debug(user.toString());
                        if (pet.name != '') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SpiecePage(pet_name: pet.name)),
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
