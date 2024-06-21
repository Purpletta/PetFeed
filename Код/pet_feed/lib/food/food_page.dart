import 'package:flutter/material.dart';
import 'package:pet_feed/design/custom_icons.dart';
import 'package:pet_feed/design/colors.dart';
import 'package:pet_feed/food/food_analysis_widget.dart';
import 'package:pet_feed/food/food_info_widget.dart';
import 'package:pet_feed/food/food_progress_widget.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: _selectedDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                ).then((value) {
                  if (value != null) {
                    setState(() {
                      _selectedDate = value;
                    });
                  }
                });
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 10, right: 10),
                child: Icon(Icons.date_range, color: textColor),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "${_selectedDate.day}.${_selectedDate.month}.${_selectedDate.year}",
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                  color: textColor,
                  // fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        ),

        // ВИДЖЕТЫ
        FoodProgress(),
        FoodInfo(),
        FoodAnalysis(),
      ],
    );
  }
}
