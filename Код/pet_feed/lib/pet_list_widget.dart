import 'package:flutter/material.dart';
import 'package:pet_feed/bottom_nav_bar.dart';
import 'package:pet_feed/design/colors.dart';
import 'package:pet_feed/pet_info.dart';
import 'package:pet_feed/profile_page.dart';
import 'package:pet_feed/user.dart';
import 'package:pet_feed/user_provider.dart';

class PetsCard extends StatefulWidget {
  @override
  _PetsCardState createState() => _PetsCardState();
}

class _PetsCardState extends State<PetsCard> {
  @override
  Widget build(BuildContext context) {
    UserInfo user = UserProvider.of(context);
    List<String> petNames = [];
    for (PetInfo pet in user.pets) {
      petNames.add(pet.name);
    }
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: user.pets.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(petNames[index],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            color: textColor)),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete_outline,
                        color: textColor,
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Удаление питомца'),
                                content: const Text(
                                    'Вы уверены, что хотите удалить питомца?'),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('Нет'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: Text('Да'),
                                    onPressed: () {
                                      setState(() {
                                        user.pets.removeAt(index);
                                      });
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            });
                      },
                    ),
                    onTap: () {
                      user.pets.forEach((element) {
                        element.isAcive = false;
                      });
                      user.pets[index].isAcive = true;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BottomNavBar()),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
