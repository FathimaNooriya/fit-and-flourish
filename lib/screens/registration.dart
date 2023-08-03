import 'dart:async';
import 'package:flutter/material.dart';
import 'package:healthy/screens/registration2_page.dart';
import 'package:healthy/theme/colors.dart';
import 'package:healthy/theme/fonds.dart';
import 'package:healthy/theme/text_field.dart';
import 'package:healthy/widgets/button.dart';
import 'package:healthy/widgets/drop_down.dart';
import '../functions/first_page_fn.dart';
import '../widgets/appbar.dart';

class RegisrationPage extends StatefulWidget {
  const RegisrationPage({super.key});

  @override
  State<RegisrationPage> createState() => _regisrationPageState();
}

// ignore: camel_case_types
class _regisrationPageState extends State<RegisrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().black,
      body: SafeArea(
        child: Form(
          key: formkeyRegistration,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Expanded(
            child: ListView(
              children: [
                const AppbarWigget(
                  appTitle: "Start your journey",
                  iconThere: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "You are taken first step towards your healthy body. We need a few details to kick-start your journey.",
                  style: AppFonts().normalTextWhite,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 15,
                ),
                ButtonWidget(
                  buttonColor: AppColors().black,
                  myText: TextFieldWidget(
                      number: false,
                      hintText: "What is your name?",
                      controller: nameController,
                      validatorFn: (value) {
                        return nameValidation(value);
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  buttonColor: AppColors().lavender2,
                  myText: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("What is your Gender?"),
                  ),
                ),
                ButtonWidget(
                    myText: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: DropDownWidget(
                            dropDownlist: const ["Male", "Female"],
                            dropdownValue: genterValue,
                          ),
                        )),
                    buttonColor: AppColors().grey),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  buttonColor: AppColors().black,
                  myText: TextFieldWidget(
                      number: true,
                      hintText: "How tall are you?",
                      controller: heightController,
                      validatorFn: (value) {
                        return heightValidation(value);
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  buttonColor: AppColors().black,
                  myText: TextFieldWidget(
                      number: true,
                      hintText: "What is your current weight?",
                      controller: currentWeightController,
                      validatorFn: (value) {
                        return currentWeightValidation(value);
                      }),
                ),
                const SizedBox(
                  height: 30,
                ),
                registation1Progress == true
                    ? const SizedBox(
                        width: 60,
                        height: 50,
                        child: FittedBox(
                          child: CircularProgressIndicator(),
                        ))
                    : ButtonWidget(
                        buttonColor: AppColors().white,
                        myText: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Next",
                                style: AppFonts().normalTextWhite,
                              ),
                            ),
                            Icon(
                              Icons.arrow_right_sharp,
                              color: AppColors().greyText,
                            ),
                          ],
                        ),
                        onTapFunction: () async {
                          setState(() {
                            registation1Progress = true;
                          });
                          Timer(const Duration(seconds: 2), () async {
                            await gotoNext();
                            registation1Progress = false;
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Registration2Page(),
                            ));
                          });
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// DateTime selectedDate = DateTime.now();
// Future<void> selectDate(BuildContext context) async {
//   final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime(2015, 8),
//       lastDate: DateTime(2101));

//   if (picked != null && picked != selectedDate) {
//     // setState(() {
//     selectedDate = picked;
//     //   });
//   }
// }
