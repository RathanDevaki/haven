import 'package:flutter/material.dart';

import '../Models/user_model.dart';
import 'accept_request.dart';

class UserView extends StatelessWidget {
  const UserView({Key? key, required this.userModel}) : super(key: key);
  //final User user;
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userModel.name.toString()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(
              userModel.address.toString(),
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              width: double.infinity,
              height: 4,
            ),
            Text(
              userModel.email.toString(),
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
