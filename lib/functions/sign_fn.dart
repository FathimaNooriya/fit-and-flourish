// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/admin_login.dart';

String userName = " user name";
String userPassword = " user password";
final formkeySignUp = GlobalKey<FormState>();
TextEditingController UserNameSisnUp = TextEditingController();
TextEditingController UserPassword = TextEditingController();

String? signUpUserNameValidation() {
  if (UserNameSisnUp.text.isEmpty) {
    return "Please Enter the user name";
  }
  return null;
}

String? signUpPasswordValidation() {
  if (UserPassword.text.isEmpty) {
    return "Please Enter the password name";
  } else {
    return null;
  }
}

signUpfn(context) async {
  if (!formkeySignUp.currentState!.validate()) {
    return;
  } else {
    //if (UserNameSisnUp.text == "user" && UserPassword.text == "user") {
    final sharedpre = await SharedPreferences.getInstance();
    await sharedpre.clear();
    await sharedpre.setString(userName, UserNameSisnUp.text);
    await sharedpre.setString(userPassword, UserPassword.text);
    //await sharedpre.setBool(userSaveKey, true);
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => AdminLogin()),
    );
    adminClearData();
    //   }
  }
}

// printfn(context) async {
//   final sharedpre = await SharedPreferences.getInstance();
//   String? na = sharedpre.getString(userName);
//   String? pa = sharedpre.getString(userPassword);
//   print(na);
//   print(pa);
//   Navigator.of(context).push(
//     MaterialPageRoute(builder: (context) => adminLogin()),
//   );
// }

adminClearData() {
  UserNameSisnUp.clear();
  UserPassword.clear();
}
