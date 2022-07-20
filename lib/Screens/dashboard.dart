//import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:haven/Screens/accept_request.dart';
import 'package:haven/Screens/snackScreen.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Haven"),
        elevation: .1,
        backgroundColor: Color.fromRGBO(49, 87, 110, 1.0),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
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

  InkWell makeDashboardItem(String title, int id, IconData icon) {
    return InkWell(
      child: Card(
          elevation: 1.0,
          margin: new EdgeInsets.all(8.0),
          child: Container(
            decoration:
                BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
            child: new InkWell(
              onTap: () {
                if (id == 1) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FinalView(),
                    ),
                  );
                } else if (id == 2) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyHomePage1()));
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  SizedBox(height: 50.0),
                  Center(
                      child: Icon(
                    icon,
                    size: 40.0,
                    color: Colors.black,
                  )),
                  SizedBox(height: 20.0),
                  new Center(
                    child: new Text(title,
                        style:
                            new TextStyle(fontSize: 18.0, color: Colors.black)),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
