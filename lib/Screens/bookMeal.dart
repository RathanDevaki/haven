import 'dart:developer';

import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../Models/book_meal_model.dart';
import '../components/default_button.dart';

class BookMeal extends StatefulWidget {
  @override
  CheckBoxListTileDemoState createState() => new CheckBoxListTileDemoState();
}

class CheckBoxListTileDemoState extends State<BookMeal> {
  String breakfast = 'NA';
  String lunch = 'NA';
  String dinner = 'NA';
  List<CheckBoxListTileModel> checkBoxListTileModel =
      CheckBoxListTileModel.getUsers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'CheckBox ListTile Demo',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: checkBoxListTileModel.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          CheckboxListTile(
                            activeColor: Colors.orange,
                            dense: true,
                            //font change
                            title: Text(
                              checkBoxListTileModel[index].title.toString(),
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5),
                            ),
                            value: checkBoxListTileModel[index].isCheck,
                            secondary: SizedBox(
                              height: 100,
                              width: 50,
                              child: AvatarView(
                                radius: 60,
                                avatarType: AvatarType.CIRCLE,
                                imagePath:
                                    checkBoxListTileModel[index].img.toString(),
                                errorWidget: Container(
                                  child: Icon(
                                    Icons.error,
                                    size: 50,
                                  ),
                                ),
                              ),
                            ),
                            onChanged: (val) {
                              itemChange(val, index);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            DefaultButton(
              text: "Book Your Meal",
              press: () {
                log('$breakfast $lunch $dinner');
              },
            ),
          ],
        ),
      ),
    );
  }

  void itemChange(bool? val, int index) {
    setState(() {
      checkBoxListTileModel[index].isCheck = val;
      log('$index ---> ${val.toString()}');
      if (index == 0 && val == true) {
        breakfast = "Booked";
      } else {
        breakfast = "NA";
      }
      if (index == 1 && val == true) {
        lunch = "Booked";
      } else {
        lunch = "NA";
      }
      if (index == 2 && val == true) {
        dinner = "Booked";
      } else {
        dinner = "NA";
      }
      log('$breakfast $lunch $dinner');
    });
  }
}
