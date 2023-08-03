import 'dart:io';
import 'package:flutter/material.dart';
import 'package:healthy/theme/colors.dart';
import 'package:healthy/widgets/button.dart';
import '../functions/meal_fn.dart';
import '../theme/fonds.dart';
import '../widgets/appbar.dart';
import 'meal.dart';

class AddLunchScreen extends StatelessWidget {
  const AddLunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors().black,
          body: Column(
            children: [
              AppbarWigget(
                appTitle: "Add last meal ..",
                iconThere: true,
                function: () {
                  meal.clear();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const MealScreen(),
                  ));
                },
              ),

              const SizedBox(
                height: 10,
              ),
              // buttonWidget(
              //     myText: const TextField(), buttonColor: AppColors().black),
              // const SizedBox(
              //   height: 10,
              // ),
              Expanded(
                child: ListView.builder(
                    itemCount: meal.length,
                    itemBuilder: (context, index) {
                      final mealData = meal[index];
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
                            ],
                          ),
                        ),
                        onTapFunction: () async {
                          mealData.mealCategory == "Brakefast"
                              ? {
                                  breakFastList.add(mealData),
                                  await breakFastCalorie(mealData)
                                }
                              : mealData.mealCategory == "Lunch"
                                  ? {
                                      lunchList.add(mealData),
                                      await lunchCalorie(mealData)
                                    }
                                  : {
                                      dinnerList.add(mealData),
                                      await dinnerCalorie(mealData)
                                    };
                          await totalNutritioncalorie(mealData);
                          await targetNutrients();
                          // print("addddddddddddding.............");
                          // print(totalProtein);
                          // print(targetProtein);
                          // print(((totalProtein / targetProtein)));
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const MealScreen(),
                          ));
                          //    Navigator.of(context).pop();
                        },
                      );
                    }),
              ),
              // buttonWidget(
              //     myText: ListTile(
              //       title: const Text("Tea"),
              //       subtitle: const Text("100 cal/glass"),
              //       trailing: Image.asset("assets/images/tea.png"),
              //     ),
              //     buttonColor: AppColors().black)
            ],
          )),
    );
  }
}
