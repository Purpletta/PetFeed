import 'package:flutter/material.dart';
import 'package:pet_feed/design/custom_icons.dart';
import 'package:pet_feed/design/colors.dart';

class FoodAnalysis extends StatelessWidget {
  const FoodAnalysis({super.key});

  @override
  Widget build(BuildContext context) {
    double protein = 0;
    double fat = 0;
    double calcium = 0;
    double phosphorus = 0;
    int vitA = 0;
    int vitD = 0;
    int vitE = 0;
    double ferrum = 0;
    double copper = 0;
    double zinc = 0;
    double manganese = 0;
    double iodine = 0;
    double selenium = 0;

    const textStyleFirst =
        TextStyle(fontFamily: 'Montserrat', fontSize: 20, color: textColor);

    const textStyleSecond =
        TextStyle(fontFamily: 'Montserrat', fontSize: 16, color: textColor);

    const textStyleRowName =
        TextStyle(fontFamily: 'Montserrat', fontSize: 18, color: textColor);

    const empty =
        TextStyle(fontFamily: 'Montserrat', fontSize: 8, color: textColor);

    const textStyleColName = TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: 'Montserrat',
        fontSize: 16,
        color: textColor);

    return Container(
      width: 390,
      height: 530,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 5, 5, 20),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: mainWhiteColor,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Анализ корма",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          fontSize: 25,
                          color: textColor))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(3),
                  1: FlexColumnWidth(2),
                  2: FlexColumnWidth(2),
                },
                children: [
                  const TableRow(children: [
                    Text("Элемент",
                        textAlign: TextAlign.center, style: textStyleColName),
                    Text("Есть",
                        textAlign: TextAlign.center, style: textStyleColName),
                    Text("Минимум",
                        textAlign: TextAlign.center, style: textStyleColName),
                  ]),
                  const TableRow(children: [
                    Text(
                      "",
                      style: empty,
                    ),
                    Text(
                      "",
                      style: empty,
                    ),
                    Text(
                      "",
                      style: empty,
                    )
                  ]),
                  TableRow(children: [
                    const Text("Белки",
                        textAlign: TextAlign.center, style: textStyleRowName),
                    Text("$protein%",
                        textAlign: TextAlign.center, style: textStyleFirst),
                    const Text("26%",
                        textAlign: TextAlign.center, style: textStyleFirst),
                  ]),
                  TableRow(children: [
                    const Text("Жиры",
                        textAlign: TextAlign.center, style: textStyleRowName),
                    Text("$fat%",
                        textAlign: TextAlign.center, style: textStyleFirst),
                    const Text("9%",
                        textAlign: TextAlign.center, style: textStyleFirst),
                  ]),
                  TableRow(children: [
                    const Text("Кальций",
                        textAlign: TextAlign.center, style: textStyleRowName),
                    Text("$calcium%",
                        textAlign: TextAlign.center, style: textStyleFirst),
                    const Text("0.6%",
                        textAlign: TextAlign.center, style: textStyleFirst),
                  ]),
                  TableRow(children: [
                    const Text("Фосфор",
                        textAlign: TextAlign.center, style: textStyleRowName),
                    Text("$phosphorus%",
                        textAlign: TextAlign.center, style: textStyleFirst),
                    const Text("0.5%",
                        textAlign: TextAlign.center, style: textStyleFirst),
                  ]),
                  TableRow(children: [
                    const Text("Витамин А",
                        textAlign: TextAlign.center, style: textStyleRowName),
                    Text("$vitA ME",
                        textAlign: TextAlign.center, style: textStyleSecond),
                    const Text("3332 ME",
                        textAlign: TextAlign.center, style: textStyleSecond),
                  ]),
                  TableRow(children: [
                    const Text("Витамин D",
                        textAlign: TextAlign.center, style: textStyleRowName),
                    Text("$vitD ME",
                        textAlign: TextAlign.center, style: textStyleSecond),
                    const Text("280 ME",
                        textAlign: TextAlign.center, style: textStyleSecond),
                  ]),
                  TableRow(children: [
                    const Text("Витамин Е",
                        textAlign: TextAlign.center, style: textStyleRowName),
                    Text("$vitE ME",
                        textAlign: TextAlign.center, style: textStyleSecond),
                    const Text("40 ME",
                        textAlign: TextAlign.center, style: textStyleSecond),
                  ]),
                  TableRow(children: [
                    const Text("Железо",
                        textAlign: TextAlign.center, style: textStyleRowName),
                    Text("$ferrum мг",
                        textAlign: TextAlign.center, style: textStyleSecond),
                    const Text("80 мг",
                        textAlign: TextAlign.center, style: textStyleSecond),
                  ]),
                  TableRow(children: [
                    const Text("Медь",
                        textAlign: TextAlign.center, style: textStyleRowName),
                    Text("$copper мг",
                        textAlign: TextAlign.center, style: textStyleSecond),
                    const Text("5 мг",
                        textAlign: TextAlign.center, style: textStyleSecond),
                  ]),
                  TableRow(children: [
                    const Text("Цинк",
                        textAlign: TextAlign.center, style: textStyleRowName),
                    Text("$zinc мг",
                        textAlign: TextAlign.center, style: textStyleSecond),
                    const Text("75 мг",
                        textAlign: TextAlign.center, style: textStyleSecond),
                  ]),
                  TableRow(children: [
                    const Text("Марганец",
                        textAlign: TextAlign.center, style: textStyleRowName),
                    Text("$manganese мг",
                        textAlign: TextAlign.center, style: textStyleSecond),
                    const Text("7.6 мг",
                        textAlign: TextAlign.center, style: textStyleSecond),
                  ]),
                  TableRow(children: [
                    const Text("Йод",
                        textAlign: TextAlign.center, style: textStyleRowName),
                    Text("$iodine мг",
                        textAlign: TextAlign.center, style: textStyleSecond),
                    const Text("0.6 мг",
                        textAlign: TextAlign.center, style: textStyleSecond),
                  ]),
                  TableRow(children: [
                    const Text("Селен",
                        textAlign: TextAlign.center, style: textStyleRowName),
                    Text("$selenium мг",
                        textAlign: TextAlign.center, style: textStyleSecond),
                    const Text("0.3 мг",
                        textAlign: TextAlign.center, style: textStyleSecond),
                  ]),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
