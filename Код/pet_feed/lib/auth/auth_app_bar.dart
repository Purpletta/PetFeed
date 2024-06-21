import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_feed/design/colors.dart';

class AuthAppBar extends StatelessWidget {
  const AuthAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
              color: mainWhiteColor, fontSize: 40, fontFamily: 'Aclonica'),
        ),
      ],
    );
  }
}
