
import 'package:flutter/material.dart';
import 'package:healthy/screens/signup_page.dart';
import 'package:healthy/theme/fonds.dart';
import '../functions/admin_functions.dart';
import '../theme/colors.dart';
import '../theme/text_field.dart';
import '../widgets/appbar.dart';
import '../widgets/button.dart';

class AdminLogin extends StatelessWidget {
  const AdminLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().black,
      body: SafeArea(
        child: Form(
          key: formkeyAdminLogin,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Expanded(
            child: ListView(children: [
              //    ChoiceChip(label: , selected: selected),
              const AppbarWigget(
                appTitle: "Admin...",
                iconThere: false,
              ),
              const SizedBox(
                height: 200,
              ),
              ButtonWidget(
                buttonColor: AppColors().black,
                myText:
                    //  TextFormField(
                    //   controller: adminUsername,
                    //   validator: (value) {
                    //     if (adminUsername.text.isEmpty) {
                    //       return "Please Enter the user name";
                    //     }
                    //     //   userNameValidation();
                    //   },
                    // )
                    TextFieldWidget(
                        number: false,
                        hintText: "UserName",
                        controller: adminUsername,
                        validatorFn: (value) {
                          return userNameValidation();
                          // if (adminUsername.text.isEmpty) {
                          //   return "Please Enter the user name";
                          // }
                        }),
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonWidget(
                buttonColor: AppColors().black,
                myText:
                    //  TextFormField(
                    //   controller: adminPassword,
                    //   validator: (value) {
                    //     if (adminPassword.text.isEmpty) {
                    //       return "Please Enter the password";
                    //       // } else {
                    //       //   return null;
                    //     }

                    //     //passwordValidation();
                    //   },
                    // )
                    TextFieldWidget(
                        number: false,
                        hintText: "Password",
                        controller: adminPassword,
                        validatorFn: (value) {
                          return passwordValidation();
                          // if (adminPassword.text.isEmpty) {
                          //   return "Please Enter the password";
                          // } else {
                          //   return null;
                          //}
                        }),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: InkWell(
                  child: ButtonWidget(
                    buttonColor: AppColors().grey,
                    myText: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Login",
                        style: AppFonts().normalTextWhite,
                      ),
                    ),
                  ),
                  onTap: () {
                    adminlogin(context);
                  },
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const SignUpPage()),
                    );
                  },
                  child: const Text("sign Up"))
            ]),
          ),
        ),
      ),
    );
  }
}
