// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:healthy/screens/admin_login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../db_functions/admin_meal_db_fn.dart';
import '../functions/admin_functions.dart';
import '../models/admin_meal_model.dart';
import '../theme/colors.dart';
import '../theme/fonds.dart';
import '../widgets/alert_dialog.dart';
import '../widgets/button.dart';
import 'admin_add_meal_page.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _adminHomeScreenState();
}

// ignore: camel_case_types
class _adminHomeScreenState extends State<AdminHomeScreen> {
  @override
  void initState() {
   // openBox();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().black,
      body: SafeArea(
          child: Column(children: [
        //    ChoiceChip(label: , selected: selected),
        AppBar(
          backgroundColor: const Color.fromARGB(255, 22, 0, 32),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back)),
          title: Text(
            "Admin Home",
            style: AppFonts().headdingWhite,
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  showDialog(
                      context: context,
                      builder: ((context) {
                        return AlertDialog(
                          title: const Text('Wannig'),
                          content:
                              const Text("Are you sure you want to Log out"),
                          actions: [
                            ElevatedButton(
                                onPressed: () async {
                                  final sharedPref =
                                      await SharedPreferences.getInstance();
                                  await sharedPref.clear();
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: ((context2) =>
                                              const AdminLogin())),
                                      (route) => false);
                                  adminLogoutFn();
                                },
                                child: const Text("yes")),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("no"))
                          ],
                        );
                      }));
                },
                icon: const Icon(Icons.logout)),
          ],
        ),
        // appbarWigget(
        //   appTitle: "Admin Home",
        //   iconThere: true,
        // ),
        const SizedBox(
          height: 10,
        ),
        ValueListenableBuilder(
            valueListenable: adminMealList,
            builder: (BuildContext ctx, List<AdminMealModel> adminMealListView,
                Widget? child) {
              return Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: adminMealListView.length,
                    itemBuilder: (context, index) {
                      final mealData = adminMealListView[index];
                      // return Container(
                      //   height: 50,
                      //   color: AppColors().lavender,
                      // );
                      return ButtonWidget(
                          buttonColor: AppColors().white,
                          myText: Card(
                            elevation: 10,
                            color: AppColors().grey,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 50,
                                  height: 100,
                                  child: Image(
                                    image: FileImage(File(
                                      mealData.mealImage,
                                    )),
                                  ),
                                ),

                                // "assets/images/tea.png",

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: 150,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Text(mealData.mealName,
                                              overflow: TextOverflow.ellipsis,
                                              //   maxLines: 1,
                                              style: AppFonts().headding2black),
                                        ),
                                        Text(
                                          mealData.mealCategory,
                                          //  "Tea/ 1cup",
                                          style: AppFonts().headding2black,
                                        ),
                                        Text(
                                          "Total Calorie ${mealData.mealCalorie}",
                                          // "64 Cal",
                                          style: AppFonts().normalTextBlack,
                                        ),
                                        Text(
                                          "Protein      ${mealData.protein}",
                                          // "Protein     15.1g",
                                          style: AppFonts().normalTextBlack,
                                        ),
                                        Text(
                                          "Fats      ${mealData.fat}",
                                          // "Fats          10.1g",
                                          style: AppFonts().normalTextBlack,
                                        ),
                                        Text(
                                          "Carbs      ${mealData.carbs}",
                                          //"Carbs        87.1g",
                                          style: AppFonts().normalTextBlack,
                                        ),
                                        Text(
                                          "Fiber      ${mealData.fiber}",
                                          // "Fiber           5.7g",
                                          style: AppFonts().normalTextBlack,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        alertDialogWidget(context, index);
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) =>
                                                AdminAddMealPage(
                                              editMeal: true,
                                              mealName: mealData.mealName,
                                              mealCalorie: mealData.mealCalorie,
                                              mealCategory:
                                                  mealData.mealCategory,
                                              mealAmount: mealData.mealAmount,
                                              mealImage: mealData.mealImage,
                                              protein: mealData.protein,
                                              carbs: mealData.carbs,
                                              fat: mealData.fat,
                                              fiber: mealData.fiber,
                                              index: index,
                                            ),
                                          ));
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          color: AppColors().pink,
                                        )),
                                    // InkWell(
                                    //   child: SizedBox(
                                    //     width: 70,
                                    //     child: ButtonWidget(
                                    //       buttonColor: AppColors().white,
                                    //       myText: Padding(
                                    //         padding: const EdgeInsets.all(8.0),
                                    //         child: Text(
                                    //           "Edit",
                                    //           style: AppFonts().normalTextBlack,
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ),
                                    //   onTap: () {

                                    //   },
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                          )
                          //  ListTile(
                          //   leading: Image.asset("assets/images/tea.png"),
                          //   title: Text(
                          //     "Tea/ 1cup",
                          //     style: AppFonts().headding2black,
                          //   ),
                          //   subtitle: Text(
                          //     "64 Cal",
                          //     style: AppFonts().normalTextWhite,
                          //   ),
                          //   trailing: Row(
                          //     mainAxisAlignment: MainAxisAlignment.end,
                          //     children: [
                          //       IconButton(
                          //         onPressed: () {},
                          //         icon: Icon(
                          //           Icons.delete,
                          //           color: Colors.red,
                          //         ),
                          //       ),
                          //       SizedBox(
                          //         width: 70,
                          //         child: ButtonWidget(
                          //           buttonColor: AppColors().white,
                          //           myText: Text(
                          //             "Edit",
                          //             style: AppFonts().normalTextBlack,
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          //   onTap: () {
                          //     // Navigator.of(context).push(MaterialPageRoute(
                          //     //   builder: (context) => weightGoalScreen(),
                          //     // ));
                          //   },
                          // ),
                          );
                    }),
              );
            }),
      ])),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          clearData();
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AdminAddMealPage(editMeal: false),
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
