// @dart=2.9
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:haven/Screens/appbar.dart';
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
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      body: ListView(
        children: [
          Checkbox(
            value: value,
            onChanged: (value) {
              setState(() {
                this.value = value;
              });
            },
          )
        ],
      ),
    );
  }
}
