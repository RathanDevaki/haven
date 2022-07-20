import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
//import 'package:http/http.dart' as http;
import 'dart:convert';

class MyHomePage1 extends StatefulWidget {
  @override
  _MyHomePageState1 createState() => _MyHomePageState1();
}

class _MyHomePageState1 extends State<MyHomePage1> {
  String ROOT =
      "http://www.json-generator.com/api/json/get/bYKKPeXRcO?indent=2";

  Future<List<User>> _getUsers() async {
    //final response = await http.post(Uri.parse(ROOT), body: map);
    final String response =
        await rootBundle.loadString('assets/generated.json');
    // var data = await http.get(Uri.parse(ROOT));
    var jsonData = json.decode(response);

    List<User> users = [];
    for (var u in jsonData) {
      User user = User(u["index"], u["about"], u["name"], u["picture"],
          u["company"], u["email"]);
      users.add(user);
    }

    print("the count is " + users.length.toString());

    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getUsers(),
          builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
            if (asyncSnapshot.data == null) {
              return Container(
                child: Center(
                  child: Text("Loading ........"),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: asyncSnapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(asyncSnapshot.data[index].name),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          asyncSnapshot.data[index].picture +
                              asyncSnapshot.data[index].index.toString() +
                              ".jpg"),
                    ),
                    subtitle: Text(asyncSnapshot.data[index].email),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(asyncSnapshot.data[index])));
                    },
                  );
                },
              );
            }
          },
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class User {
  final int index;
  final String about;
  final String name;
  final String picture;
  final String company;
  final String email;

  User(this.index, this.about, this.name, this.picture, this.company,
      this.email);
}

class DetailPage extends StatelessWidget {
  final User user;

  DetailPage(this.user);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Container(
        child: Center(
          child: Text(this.user.about),
        ),
      ),
    );
  }
}
