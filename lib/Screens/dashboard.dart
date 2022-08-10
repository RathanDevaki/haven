//import 'dart:developer';
//hi
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:haven/Screens/accept_request.dart';
import 'package:haven/Screens/appbar.dart';
import 'package:haven/Screens/bookMeal.dart';
import 'package:haven/Screens/message.dart';
import 'package:haven/Screens/profile/profile_screen.dart';
import 'package:haven/Screens/qr_generator.dart';
import 'package:haven/Screens/qr_scanner.dart';
import 'package:haven/Screens/sign_in/sign_in_screen.dart';
import 'package:haven/Screens/sign_up/sign_up_screen.dart';
import 'package:haven/Screens/snackScreen.dart';

import '../temp.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
            makeDashboardItem("Accept Request", 1, Icons.supervisor_account),
            makeDashboardItem("Students List", 2, Icons.view_list_outlined),
            makeDashboardItem("Cancelled Meals", 3, Icons.no_meals),
            makeDashboardItem(
                "Room Allocation", 4, Icons.airline_seat_individual_suite),
            makeDashboardItem("Send Message", 5, Icons.sms),
            makeDashboardItem("Profile", 6, Icons.account_balance_outlined)
          ],
        ),
      ),
    );
  }

  Card makeDashboardItem(String title, int id, IconData icon) {
    return Card(
      elevation: 1.0,
      margin: const EdgeInsets.all(14.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Neumorphic(
        style: NeumorphicStyle(
            shadowLightColor: Colors.black,
            shape: NeumorphicShape.concave,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
            depth: 5,
            lightSource: LightSource.bottomRight,
            color: Colors.white10),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            if (id == 1) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            } else if (id == 2) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyHomePage1()));
            } else if (id == 3) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => BookMeal()));
            } else if (id == 4) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Temp()));
            } else if (id == 5) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Message()));
            } else if (id == 6) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              const SizedBox(height: 50.0),
              Center(
                  child: Icon(
                icon,
                size: 40.0,
                color: Colors.black,
              )),
              const SizedBox(height: 20.0),
              Center(
                child: Text(title,
                    style:
                        const TextStyle(fontSize: 18.0, color: Colors.black)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
