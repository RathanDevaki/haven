import 'dart:developer';

import 'package:avatar_view/avatar_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../Models/book_meal_model.dart';
import '../components/default_button.dart';

class BookMeal extends StatefulWidget {
  @override
  CheckBoxListTileDemoState createState() => new CheckBoxListTileDemoState();
}

class CheckBoxListTileDemoState extends State<BookMeal> {
  @override
  void initState() {
    super.initState();
  }

  final _auth = FirebaseAuth.instance;
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
                FirebaseFirestore.instance
                    .collection('users')
                    .doc()
                    .collection('Lu0qmss36GZfhxE6sDzhPDeEK0j9P2')
                    .add({'dinner': 'data'});
                //updateMeals(breakfast, lunch, dinner);
                log('pressed-> $breakfast $lunch $dinner');
              },
            ),
          ],
        ),
      ),
    );
  }

  Future updateMeals(String bf, String lunch, String dinner) async {
    log('BF---> $bf');
    User? user = _auth.currentUser;
    String _uid = user!.uid;
    log(_uid);
    await FirebaseFirestore.instance
        .collection('users')
        .doc()
        .collection(_uid)
        .add({
      'address': 'Rud',
      'breakfast': bf,
      'dinner': dinner,
      'lunch': lunch,
      'email': 'don@gmail.com',
      'name': 'Donz',
      'phone': '9877654321',
      'uid': '8K0TbgdrluW5Wpqf5asMwIRmje33',
    }).then((value) {
      print(value);
    });
  }

  void itemChange(bool? val, int index) {
    setState(() {
      checkBoxListTileModel[index].isCheck = val;

      if (index == 0 && val == true) {
        breakfast = "Booked";
      } else if (index == 0 && val == false) {
        breakfast = "NA";
      }

      if (index == 1 && val == true) {
        lunch = "Booked";
      } else if (index == 1 && val == false) {
        lunch = "NA";
      }
      if (index == 2 && val == true) {
        dinner = "Booked";
      }
      if (index == 2 && val == false) {
        dinner = "NA";
      }
      //log('$breakfast $lunch $dinner $val');
    });
  }
}
