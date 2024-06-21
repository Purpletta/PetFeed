import 'package:flutter/material.dart';
import 'package:pet_feed/auth/activity_page.dart';
import 'package:pet_feed/auth/spiese_page.dart';
import 'package:pet_feed/design/custom_icons.dart';
import 'package:pet_feed/design/colors.dart';
import 'package:pet_feed/pet_info.dart';
import 'package:pet_feed/user.dart';
import 'package:pet_feed/user_provider.dart';

class ProfilePage extends StatelessWidget {
  // final PetInfo pet;

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    UserInfo user = UserProvider.of(context);
    final pet = user.findActivePet();
    var cast_status = "";
    if (pet.isSterilized() && pet.gender == "Мальчик") {
      cast_status = "Кастрирован";
    } else {
      if (pet.isSterilized() && pet.gender == "Девочка") {
        cast_status = "Стерилизована";
      } else {
        if (!pet.isSterilized() && pet.gender == "Мальчик") {
          cast_status = "Не кастрирован";
        } else {
          cast_status = "Не стерилизована";
        }
      }
    }

    final catAsset = Image.asset(
      'assets/img/cat.png',
      fit: BoxFit.cover,
    );

    final dogAsset = Image.asset(
      'assets/img/dog.png',
      fit: BoxFit.cover,
    );

    Image myAsset;

    if (pet.species == "Кошка") {
      myAsset = catAsset;
    } else {
      myAsset = dogAsset;
    }

    const infoTextStyle =
        TextStyle(color: textColor, fontFamily: 'Montserrat', fontSize: 16);

    const healthTextStyle =
        TextStyle(color: textColor, fontFamily: 'Montserrat', fontSize: 16);

    return Container(
      child: Column(
        children: [
          Container(
              width: 390,
              height: 250,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: mainWhiteColor,
                    child: Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: myAsset,
                            ),
                            Column(children: [
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SpiecePage(
                                                  pet_name: pet.name)),
                                        );
                                      },
                                      icon: const Icon(Icons.edit,
                                          color: textColor)),
                                  Text(
                                    pet.name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat',
                                        fontSize: 30,
                                        color: textColor),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.all(4),
                                child: Row(
                                  children: [
                                    const Icon(CustomIcons.pawprint,
                                        color: textColor),
                                    Text(
                                      pet.species,
                                      style: infoTextStyle,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(4),
                                child: Row(
                                  children: [
                                    const Icon(Icons.person, color: textColor),
                                    Text(
                                      pet.gender,
                                      style: infoTextStyle,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(4),
                                child: Row(
                                  children: [
                                    const Icon(
                                        Icons.access_time_filled_outlined,
                                        color: textColor),
                                    Text(
                                      "${pet.age} лет",
                                      style: infoTextStyle,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(4),
                                child: Row(
                                  children: [
                                    const Icon(Icons.medication_outlined,
                                        color: textColor),
                                    Text(
                                      cast_status,
                                      style: infoTextStyle,
                                    )
                                  ],
                                ),
                              ),
                            ]),
                          ],
                        ))),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ActivityPage(pet_name: pet.name)),
                      );
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: textColor,
                    )),
                const Text(
                  ' Здоровье',
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      fontSize: 25),
                )
              ],
            ),
          ),
          Container(
              width: 390,
              height: 200,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 5, 20),
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: mainWhiteColor,
                    child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Center(
                          child: Table(
                            columnWidths: const {
                              0: FlexColumnWidth(3),
                              1: FlexColumnWidth(2)
                            },
                            children: [
                              TableRow(
                                children: [
                                  const Text(
                                    "Активность",
                                    style: healthTextStyle,
                                  ),
                                  Text(
                                    pet.activity,
                                    style: healthTextStyle,
                                    textAlign: TextAlign.right,
                                  )
                                ],
                              ),
                              TableRow(
                                children: [
                                  const Text(
                                    "Вес",
                                    style: healthTextStyle,
                                  ),
                                  Text(
                                    "${pet.weight} кг",
                                    style: healthTextStyle,
                                    textAlign: TextAlign.right,
                                  )
                                ],
                              ),
                              TableRow(
                                children: [
                                  const Text(
                                    "Особенности",
                                    style: healthTextStyle,
                                  ),
                                  Text(
                                    pet.diseases,
                                    style: healthTextStyle,
                                    textAlign: TextAlign.right,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ))),
              )),
        ],
      ),
    );
  }
}
