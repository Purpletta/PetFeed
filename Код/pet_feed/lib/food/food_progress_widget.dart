import 'package:flutter/material.dart';
import 'package:pet_feed/design/colors.dart';
import 'package:pet_feed/main.dart';

class FoodProgress extends StatefulWidget {
  const FoodProgress({super.key});

  @override
  _FoodProgressState createState() => _FoodProgressState();
}

double portion = 0;
double goal = 60;
TextEditingController _controller = TextEditingController();

TextStyle alertStyle = const TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 15,
  color: textColor,
);

class _FoodProgressState extends State<FoodProgress> {
  void _addPortion() {
    double value = double.tryParse(_controller.text) ?? 0;
    setState(() {
      portion += value.abs();
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 350,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: mainWhiteColor,
        child: Stack(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(
                            "Добавить порцию",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              fontSize: 25,
                              color: textColor,
                            ),
                          ),
                          content: TextFormField(
                            controller: _controller,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: "Введите значение",
                              hintStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15,
                                color: textColor,
                              ),
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text(
                                "Отмена",
                                style: alertStyle,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text(
                                "Добавить",
                                style: alertStyle,
                              ),
                              onPressed: () {
                                _addPortion();
                                talker.debug(portion.toString());
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.add)),
              const Text(
                " Еда",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  fontSize: 30,
                  color: textColor,
                ),
              ),
            ],
          ),
          Center(
            child: Stack(
              children: [
                Transform.scale(
                  scale: 6.5,
                  child: CircularProgressIndicator(
                    value:
                        portion / goal, // устанавливаем фиксированное значение
                    backgroundColor: mainWhiteColor,
                    valueColor: AlwaysStoppedAnimation<Color>(mainGreenColor),
                    strokeWidth: 4,
                  ),
                ),
                Text(
                  "$portion/$goal г",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    fontSize: 25,
                    color: textColor,
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
