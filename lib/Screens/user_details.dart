import 'package:flutter/material.dart';

import 'accept_request.dart';

class UserView extends StatelessWidget {
  const UserView({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.username),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              user.image,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            const SizedBox(
              width: double.infinity,
              height: 4,
            ),
            Text(
              user.username,
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              width: double.infinity,
              height: 4,
            ),
            Text(
              user.email,
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
