// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';


class Temp extends StatefulWidget {
  @override
  State<Temp> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<Temp> {
  final _auth = FirebaseAuth.instance;
  bool showProgress = false;
  String email, password;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
    backgroundColor: Colors.grey[300],
    body: Center(
    child: Container(
    width: 200,
    height: 200,
    child: Icon(Icons.android, size: 60, color: Colors.grey[800]),

    decoration: BoxDecoration(
    color: Colors.grey[300],
    shape: BoxShape.rectangle,
    boxShadow: [
    BoxShadow(
    color: Colors.grey[600],
    offset: Offset(4.0, 4.0),
    blurRadius: 15.0,
    spreadRadius: 1.0),
    BoxShadow(
    color: Colors.white,
    offset: Offset(-4.0, -4.0),
    blurRadius: 15.0,
    spreadRadius: 1.0),
    ],

    gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
    Colors.grey[200],
    Colors.grey[300],
    Colors.grey[400],
    Colors.grey[500],
    ],
    stops: [
    0.1,
    0.3,
    0.8,
    1
    ]
    )

    ),
    ),
    ),
    );
  }
}
