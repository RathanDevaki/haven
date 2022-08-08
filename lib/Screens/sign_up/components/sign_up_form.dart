import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import 'package:loading_animations/loading_animations.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

import 'package:flutter/material.dart';

import '../../../Models/user_model.dart';
import '../../../components/custom_surfix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';

import '../../../size_config.dart';
import '../../sign_in/sign_in_screen.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  static var successSnackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Success!',
      message: 'Account Created successfully\nYou can Login now',
      contentType: ContentType.success,
    ),
  );

  static var failureSnackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Something Went Wrong!',
      message: 'Sign Up Failed.\nPlease try again!',
      contentType: ContentType.failure,
    ),
  );
  final _auth = FirebaseAuth.instance;
  late bool showProgress;

  final _formKey = GlobalKey<FormState>();
  late String fullName;
  String phone = "";
  late String email;
  late String password;
  late String address;
  late String confirm_password;

  bool remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  void initState() {
    email = '';
    password = '';
    showProgress = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFullNameFormField(),
          SizedBox(height: getProportionateScreenHeight(4)),
          buildPhoneField(),
          SizedBox(height: getProportionateScreenHeight(4)),
          buildAddressFormField(),
          SizedBox(height: getProportionateScreenHeight(4)),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(4)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(4)),
          buildConformPassFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(4)),
          showProgress == false
              ? DefaultButton(
                  text: "Sign Up",
                  press: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        showProgress = true;
                      });

                      try {
                        await _auth
                            .createUserWithEmailAndPassword(
                                email: email, password: password)
                            .then((value) => postDetails())
                            .catchError((e) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(failureSnackBar);
                          setState(() {
                            showProgress = false;
                          });
                          log(e.toString());
                        });
                      } catch (e) {
                        log(e.toString());
                      }
                    } else {
                      log('error validating');
                    }
                  },
                )
              : LoadingJumpingLine.circle(
                  duration: Duration(milliseconds: 1000),
                  backgroundColor: Colors.grey,
                ),
        ],
      ),
    );
  }

  TextFormField buildFullNameFormField() {
    return TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]')),
      ],
      keyboardType: TextInputType.name,
      onSaved: (newValue) {
        fullName = newValue.toString();
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        } else {
          fullName = value;
        }
        //  log('onChanged $ _ $value');
        // return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        } else {
          fullName = value;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Full Name",
        //hintText: "Enter Full Name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User Icon.svg"),
      ),
    );
  }

  TextFormField buildPhoneField() {
    return TextFormField(
      onSaved: (newValue) {
        phone = newValue.toString();
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        } else {
          phone = value;
        }
        log('onChanged $phone _ $value');
        // return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        } else {
          phone = value;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone",
        //hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      onSaved: (newValue) {
        address = newValue.toString();
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        } else {
          address = value;
        }
        //  log('onChanged $ _ $value');
        // return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        } else {
          address = value;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Address",
        //hintText: "Enter Full Name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) {
        email = newValue.toString();
        log('onSaved $email');
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        } else {
          email = value;
        }
        log('onChanged $email _ $value');
        // return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        } else {
          email = value;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        //hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue.toString(),
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        // hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirm_password = newValue.toString(),
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password == confirm_password) {
          removeError(error: kMatchPassError);
        }
        confirm_password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        //hintText: "Re-enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  postDetails() async {
    log('inside post');
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel(
        email: user!.email.toString(),
        uid: user!.uid,
        name: fullName,
        address: address,
        phone: phone);
    await firestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap())
        .whenComplete(() {
      setState(() {
        showProgress = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(successSnackBar);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SignInScreen(),
        ),
      );
    });
  }
}
