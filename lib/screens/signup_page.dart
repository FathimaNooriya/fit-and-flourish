import 'package:flutter/material.dart';
import '../functions/sign_fn.dart';
import '../theme/colors.dart';
import '../theme/fonds.dart';
import '../theme/text_field.dart';
import '../widgets/appbar.dart';
import '../widgets/button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().black,
      body: SafeArea(
        child: Form(
          key: formkeySignUp,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Expanded(
            child: ListView(children: [
              //    ChoiceChip(label: , selected: selected),
              const AppbarWigget(
                appTitle: "Sign Up...",
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
                        controller: UserNameSisnUp,
                        validatorFn: (value) {
                          return signUpUserNameValidation();
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
                myText: TextFieldWidget(
                    number: false,
                    hintText: "Password",
                    controller: UserPassword,
                    validatorFn: (value) {
                      return signUpPasswordValidation();
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
                        "SignUp",
                        style: AppFonts().normalTextWhite,
                      ),
                    ),
                  ),
                  onTap: () {
                    signUpfn(context);
                  },
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
