import 'package:haven/Screens/accept_request.dart';

class UserModel {
  String? email;
  // String password;
  String? name;
  String? uid;
  String? phone;
  String? address;
  UserModel(
      {this.email,
      // required this.password,
      this.name,
      this.uid,
      this.phone,
      this.address});

  factory UserModel.fromMap(map) {
    return UserModel(
        email: map['email'],
        name: map['name'],
        uid: map['uid'],
        phone: map['phone'],
        address: map['address']);
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'address': address,
      'phone': phone,
    };
  }
}
