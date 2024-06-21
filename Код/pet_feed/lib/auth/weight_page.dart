import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_feed/auth/activity_page.dart';
import 'package:pet_feed/auth/auth_app_bar.dart';
import 'package:pet_feed/auth/birthDate_page.dart';
import 'package:pet_feed/auth/health_page.dart';
import 'package:pet_feed/design/colors.dart';
import 'package:pet_feed/main.dart';
import 'package:pet_feed/user.dart';
import 'package:pet_feed/user_provider.dart';

class WeightPage extends StatefulWidget {
  final String pet_name;
  const WeightPage({super.key, required this.pet_name});

  @override
  _WeightPageState createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  final weightController = TextEditingController();
  double weight = 0.0;
  Color bColor = mainWhiteColor;
  final _formKey = GlobalKey<FormState>();

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
                const AuthAppBar(),

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
                                    ActivityPage(pet_name: widget.pet_name)),
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
                  'Вес питомца',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: mainWhiteColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),

                const SizedBox(height: 16),

                // поле выбора активности
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: weightController,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          onChanged: (value) {
                            // обработка ввода
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              bColor = dangerColor;
                              return 'Поле не может быть пустым';
                            }
                            try {
                              double.parse(value);
                              return null;
                            } catch (e) {
                              bColor = dangerColor;
                              return 'Введите корректное число';
                            }
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white, // цвет заливки
                            hintText: 'Вес в килограммах', // подсказка
                            hintStyle: TextStyle(
                                color: textColor.withOpacity(0.9),
                                fontSize: 15,
                                fontFamily: 'Montserrat'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: bColor)),
                          ),
                        )
                      ],
                    )),

                const SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            user.findPetByName(widget.pet_name)!.weight =
                                double.tryParse(weightController.text) ?? 0.0;
                          });
                          talker.debug(user.toString());
                          if (user.findPetByName(widget.pet_name)!.weight !=
                              0.0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      HealthPage(pet_name: widget.pet_name)),
                            );
                          }
                        } else {
                          setState(() {
                            bColor = dangerColor;
                          });
                        }
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
        ],
      ),
    );
  }
}
