import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
//import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:haven/Screens/user_details.dart';

import '../Models/user_model.dart';

class MyHomePage1 extends StatefulWidget {
  @override
  _MyHomePageState1 createState() => _MyHomePageState1();
}

class _MyHomePageState1 extends State<MyHomePage1> {
  final user = FirebaseAuth.instance.currentUser;
  List<UserModel> users = [];
  //User? user = FirebaseAuth.instance.currentUser as User?;
  UserModel loggedInUser = UserModel();
  // List<User> usesrs = [
  //   const User(
  //       username: 'Rathan',
  //       email: 'rtn@gmail.com',
  //       image:
  //           'https://i.pinimg.com/originals/57/74/c7/5774c7734711611fc5f3c0731af95be4.png'),
  // ];
  String id = 'DubHE0mLmZXUI71LW03S1wd94KR2';
  // CollectionReference users1 = FirebaseFirestore.instance.collection('users');
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();
  late String letter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List"),
        ),
        body: Container(
            child: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            } else {
              log('has data');
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                UserModel user1 = UserModel();
                letter=user1.name = data['name'];

                user1.phone = data['phone'];
                user1.email = data['email'];
                user1.address = data['address'];
                user1.uid = data['uid'];


                return ListTile(
                  title: Text(data['name'] == null ? 'Empty' : data['name']),
                  subtitle: Text(data['address']!),
                  leading: CircleAvatar(
                    radius: 16.0,
                    child: ClipRRect(
                      child: Text(letter[0]),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  trailing:Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UserView(userModel: user1)));
                  },
                );
              }).toList(),
            );
          },
        ))
        // child: ListView.builder(
        //   itemCount: temp.length,
        //   itemBuilder: ((context, index) {
        //     // final user = users[index];
        //     return Card(
        //       child: ListTile(
        //         leading: const CircleAvatar(
        //           radius: 28,
        //           backgroundImage: NetworkImage(
        //               'https://i.pinimg.com/originals/57/74/c7/5774c7734711611fc5f3c0731af95be4.png'),
        //         ),
        //         title: Text(loggedInUser.name.toString()),
        //         subtitle: Text(loggedInUser.email.toString()),
        //         trailing: const Icon(Icons.arrow_forward),
        //         onTap: () {
        //           // Navigator.of(context).push(MaterialPageRoute(
        //           //     builder: (context) => UserView(
        //           //           user:user,
        //           //         )));
        //         },
        //       ),
        //     );
        //   }),
        // ),
        );
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}

class User {
  final String username;
  final String email;
  final String image;
  const User(
      {required this.username, required this.email, required this.image});
}

// final _fireStore = FirebaseFirestore.instance;
// Future<void> getData() async {
//   // Get docs from collection reference
//   QuerySnapshot querySnapshot = await _fireStore.collection('users').get();

//   // Get data from docs and convert map to List
//   var allData = querySnapshot.docs.map((doc) => doc.data()).toList();
//   //for a specific field
//   // allData = querySnapshot.docs.map((doc) => doc.get()).toList();
// log('Data:--- ${allData')
//   print(allData);
// }
//https://firebase.flutter.dev/docs/firestore/usage/