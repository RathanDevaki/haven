import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
//import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:haven/Screens/user_details.dart';

class MyHomePage1 extends StatefulWidget {
  @override
  _MyHomePageState1 createState() => _MyHomePageState1();
}

class _MyHomePageState1 extends State<MyHomePage1> {
  List<User> users = [
    const User(
        username: 'Rathan',
        email: 'rtn@gmail.com',
        image:
            'https://i.pinimg.com/originals/57/74/c7/5774c7734711611fc5f3c0731af95be4.png'),
    const User(
        username: 'Don',
        email: 'don@gmail.com',
        image:
            'https://www.kindpng.com/picc/m/499-4993674_mb-ani-bean-cartoon-mr-bean-drawing-hd.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: ((context, index) {
            final user = users[index];
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(user.image),
                ),
                title: Text(user.username),
                subtitle: Text(user.email),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UserView(
                            user: user,
                          )));
                },
              ),
            );
          }),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class User {
  final String username;
  final String email;
  final String image;
  const User(
      {required this.username, required this.email, required this.image});
}
