import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_feed/auth/reg_page_1.dart';
import 'package:pet_feed/bottom_nav_bar.dart';
import 'package:pet_feed/design/colors.dart';
import 'package:pet_feed/user.dart';
import 'package:pet_feed/user_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String email = '';
  String password = '';

  final textInFormFieldStyle = TextStyle(
      color: textColor.withOpacity(0.9),
      fontSize: 15,
      fontFamily: 'Montserrat');

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

          // форма для ввода логина и пароля
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // логотип
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

                const SizedBox(height: 50),
                const Text(
                  'Вход',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: mainWhiteColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),

                const SizedBox(height: 32),

                // поле ввода почты
                const Row(
                  children: [
                    Text(
                      'Почта',
                      style: TextStyle(
                          color: textColor,
                          fontSize: 18,
                          fontFamily: 'Montserrat'),
                    ),
                  ],
                ),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Введите почту',
                    hintStyle: textInFormFieldStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  controller: emailController,
                ),

                const SizedBox(height: 16),

                // поле ввода пароля
                const Row(
                  children: [
                    Text(
                      'Пароль',
                      style: TextStyle(
                          color: textColor,
                          fontSize: 18,
                          fontFamily: 'Montserrat'),
                    ),
                  ],
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true, // закрашивает поле ввода
                    fillColor: Colors.white, // цвет заливки
                    hintText: 'Введите пароль', // подсказка
                    hintStyle: textInFormFieldStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  controller: passwordController,
                ),

                const SizedBox(height: 8),

                // кнопка "Забыли пароль"
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Забыли пароль?',
                      style: TextStyle(
                          color: textColor,
                          fontSize: 16,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                ),

                const SizedBox(height: 32),

// кнопка ВОЙТИ
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      email = emailController.text;
                      password = passwordController.text;
                    });
                    if (email != '' && password != '') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BottomNavBar()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: textColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fixedSize: const Size(350, 60)),
                  child: const Text(
                    'Войти',
                    style: TextStyle(
                        color: mainWhiteColor, // цвет текста
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'),
                  ),
                ),

                const SizedBox(height: 16),

// кнопка РЕГИСТРАЦИИ
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          textColor.withOpacity(0.5), // цвет фона кнопки
                      shape: RoundedRectangleBorder(
                        // закругление краев
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fixedSize: const Size(350, 20)),
                  child: const Text(
                    'Нет аккаунта? Зарегистрируйтесь',
                    style: TextStyle(
                        color: mainWhiteColor, // цвет текста
                        fontSize: 16,
                        fontFamily: 'Montserrat'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
