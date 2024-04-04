// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../functions/admin_functions.dart';
import '../theme/colors.dart';
import '../theme/fonds.dart';
import '../theme/text_field.dart';
import '../widgets/appbar.dart';
import '../widgets/button.dart';
import '../widgets/drop_down.dart';

// ignore: must_be_immutable
class AdminAddMealPage extends StatefulWidget {
  String? mealName;
  String? mealCategory;
  double? mealCalorie;
  double? protein;
  double? fat;
  double? carbs;
  double? fiber;
  String? mealImage;
  String? mealAmount;
  int? index;
  bool editMeal = false;
  AdminAddMealPage(
      {super.key,
      this.mealName,
      this.mealCategory,
      this.mealImage,
      this.mealAmount,
      this.mealCalorie,
      this.protein,
      this.carbs,
      this.fat,
      this.fiber,
      this.index,
      required this.editMeal});

  @override
  State<AdminAddMealPage> createState() => _adminAddMealPageState();
}

// ignore: camel_case_types
class _adminAddMealPageState extends State<AdminAddMealPage> {
  @override
  void initState() {
    if (widget.editMeal) {
      mealNameController = TextEditingController(text: widget.mealName);
      mealCalorieController =
          TextEditingController(text: widget.mealCalorie.toString());
      proteinController =
          TextEditingController(text: widget.protein.toString());
      mealAmountController = TextEditingController(text: widget.mealAmount);
      fatsController = TextEditingController(text: widget.fat.toString());
      carbsController = TextEditingController(text: widget.carbs.toString());
      fiberController = TextEditingController(text: widget.fiber.toString());
      adminDropDownValue = widget.mealCategory!;
      mealImage = File(widget.mealImage!);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors().black,
        body: SafeArea(
          child: Form(
            // autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formkeyAddMeal,
            child: ListView(
              children: [
                const AppbarWigget(
                  appTitle: "Add meal",
                  iconThere: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: GestureDetector(
                    child: mealImage != null
                        ? CircleAvatar(
                            backgroundImage: FileImage(File(mealImage!.path)),
                            radius: 60,
                          )
                        : const CircleAvatar(
                            backgroundColor: Colors.amber,
                            backgroundImage: NetworkImage(
                                'https://www.eatingwell.com/thmb/m5xUzIOmhWSoXZnY-oZcO9SdArQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/article_291139_the-top-10-healthiest-foods-for-kids_-02-4b745e57928c4786a61b47d8ba920058.jpg'),
                            radius: 60,
                          ),
                    onTap: () async {
                      await pickImage(ImageSource.gallery);
                      setState(() {});
                      //  imagepicker(context);
                    },
                  ),
                  //  CircleAvatar(
                  //   backgroundImage: NetworkImage(
                  //       'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'),
                  //   radius: 60,
                  // ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Visibility(
                    visible: addMealImage,
                    child: const Text(
                      'Please Add Photo',
                      style: TextStyle(color: Color.fromARGB(255, 177, 22, 11)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ButtonWidget(
                  buttonColor: AppColors().black,
                  myText: TextFieldWidget(
                    number: false,
                    hintText: "Meal Name",
                    controller: mealNameController,
                    validatorFn: (value) {
                      return mealNameValidation(value!);
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  buttonColor: AppColors().black,
                  myText: TextFieldWidget(
                      number: true,
                      hintText: "Amount meal",
                      controller: mealAmountController,
                      validatorFn: (value) {
                        return mealAmountValidation(value!);
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  buttonColor: AppColors().black,
                  myText: TextFieldWidget(
                      number: true,
                      hintText: "Amount of Calorie",
                      controller: mealCalorieController,
                      validatorFn: (value) {
                        return mealCalorieValidation(value!);
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                    myText: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: DropDownWidget(
                            dropDownlist: ["Brakefast", "Lunch", "Dinner"],
                            dropdownValue: adminDropDownValue,
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
                      hintText: "Protein",
                      controller: proteinController,
                      validatorFn: (value) {
                        return mealProteinValidation(value!);
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  buttonColor: AppColors().black,
                  myText: TextFieldWidget(
                      number: true,
                      hintText: "Fats",
                      controller: fatsController,
                      validatorFn: (value) {
                        return mealFatsValidation(value!);
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  buttonColor: AppColors().black,
                  myText: TextFieldWidget(
                      number: true,
                      hintText: "Carbs",
                      controller: carbsController,
                      validatorFn: (value) {
                        return mealCarbsValidation(value!);
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  buttonColor: AppColors().black,
                  myText: TextFieldWidget(
                      number: true,
                      hintText: "Fiber",
                      controller: fiberController,
                      validatorFn: (value) {
                        return mealFiberValidation(value!);
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: InkWell(
                    child: ButtonWidget(
                      buttonColor: AppColors().white,
                      myText: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: widget.editMeal
                            ? Text(
                                "Update",
                                style: AppFonts().normalTextWhite,
                              )
                            : Text(
                                "Save",
                                style: AppFonts().normalTextWhite,
                              ),
                      ),
                    ),
                    onTap: () {
                      widget.editMeal
                          ? saveAdminMeal(
                              widget.editMeal, context, widget.index)
                          : saveAdminMeal(widget.editMeal, context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
