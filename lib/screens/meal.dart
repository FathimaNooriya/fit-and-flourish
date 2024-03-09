import 'package:flutter/material.dart';
import 'package:healthy/screens/addlunch.dart';
import 'package:healthy/screens/home.dart';
import 'package:healthy/theme/fonds.dart';
import '../functions/meal_fn.dart';
import '../theme/colors.dart';
import '../widgets/appbar.dart';
import '../widgets/button.dart';
import '../widgets/meal_listtile.dart';
import '../widgets/nutrients.dart';

class MealScreen extends StatefulWidget {
  const MealScreen({
    super.key,
  });

  @override
  State<MealScreen> createState() => _mealScreenState();
}

// ignore: camel_case_types
class _mealScreenState extends State<MealScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            AppbarWigget(
              appTitle: "Add meal...",
              iconThere: true,
              function: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ));
              },
            ),
            // Row(
            //   children: [
            //     IconButton(
            //         onPressed: () {
            //           Navigator.of(context).pop();
            //         },
            //         icon: Icon(Icons.arrow_back)),
            //     Text(
            //       "Last meal...",
            //       style: AppFonts().headdingWhite,
            //     ),
            //   ],
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      // final data = mealOfNextDay();
                      setState(() {
                        // breakFastList = data!.listBreakFastModel;
                        // lunchList = data.listLunchModel;
                        // dinnerList = data.listDinnerModel;
                      });
                    },
                    icon: const Icon(Icons.arrow_back_ios_new)),
                Text(
                  "Today",
                  style: AppFonts().headding2White,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios)),
              ],
            ),
            ButtonWidget(
                myText: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Breakfast",
                        style: AppFonts().headding2White,
                      ),
                      Text(
                        "$totalBreakFastCalorie of ${targetBreakFastCalorie.round()} Cal",
                        style: AppFonts().headding2grey,
                      ),
                      IconButton(
                          onPressed: () {
                            meal.clear();
                            addMealTolist("Brakefast");

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const AddLunchScreen()));
                          },
                          icon: const Icon(
                            Icons.add_circle_rounded,
                          )),
                    ]),
                buttonColor: AppColors().black),
            SizedBox(
              height: 120,
              child: breakFastList.isEmpty
                  ? const Text("Add your breakfast")
                  : ListView.builder(
                      itemCount: breakFastList.length,
                      //  physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final breakfastData = breakFastList[index];
                        return MealListtile(
                          mealImage: breakfastData.mealImage,
                          mealName: breakfastData.mealName,
                          mealCalori: breakfastData.mealCalorie,
                          index: index,
                          value: breakfastData,
                        );
                      },
                    ),
            ),
            ButtonWidget(
                myText: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        " Lunch",
                        style: AppFonts().headding2White,
                      ),
                      Text(
                        "$totallunchCalorie of ${targetLunchCalorie.round()} Cal",
                        style: AppFonts().headding2grey,
                      ),
                      IconButton(
                          onPressed: () {
                            meal.clear();
                            addMealTolist("Lunch");
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const AddLunchScreen()));
                          },
                          icon: const Icon(
                            Icons.add_circle_rounded,
                          )),
                    ]),
                buttonColor: AppColors().black),
            SizedBox(
              height: 120,
              child: lunchList.isEmpty
                  ? const Text("Add your Lunch")
                  : ListView.builder(
                      itemCount: lunchList.length,
                      itemBuilder: (context, index) {
                        final lunchData = lunchList[index];
                        return MealListtile(
                          mealImage: lunchData.mealImage,
                          mealName: lunchData.mealName,
                          mealCalori: lunchData.mealCalorie,
                          index: index,
                          value: lunchData,
                        );
                      },
                    ),
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonWidget(
                myText: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        " Dinner",
                        style: AppFonts().headding2White,
                      ),
                      Text(
                        "$totaldinnerCalorie of ${targetDinnerCalorie.round()} Cal",
                        style: AppFonts().headding2grey,
                      ),
                      IconButton(
                          onPressed: () {
                            meal.clear();
                            addMealTolist("Dinner");
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const AddLunchScreen()));
                          },
                          icon: const Icon(
                            Icons.add_circle_rounded,
                          )),
                    ]),
                buttonColor: AppColors().black),
            SizedBox(
              height: 120,
              child: dinnerList.isEmpty
                  ? const Text("Add your Dinner")
                  : ListView.builder(
                      itemCount: dinnerList.length,
                      itemBuilder: (context, index) {
                        final dinnerData = dinnerList[index];
                        return MealListtile(
                          mealImage: dinnerData.mealImage,
                          mealName: dinnerData.mealName,
                          mealCalori: dinnerData.mealCalorie,
                          index: index,
                          value: dinnerData,
                        );
                      },
                    ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 200,
              child: ButtonWidget(
                  myText: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        NutrientsWidget(
                            nutrientName: "Protein",
                            nutrientValue: totalProtein.round().toString(),
                            nutrientPercent: totalProtein == 0
                                ? 0
                                : ((totalProtein / targetProtein) * 100)),
                        NutrientsWidget(
                            nutrientName: "Fats",
                            nutrientValue: totalFat.round().toString(),
                            nutrientPercent: totalFat == 0
                                ? 0
                                : ((totalFat / targetFat) * 100)),
                        NutrientsWidget(
                            nutrientName: "Carbs",
                            nutrientValue: totalCarbs.round().toString(),
                            nutrientPercent: totalCarbs == 0
                                ? 0
                                : ((totalCarbs / targetCarbs) * 100)),
                        NutrientsWidget(
                            nutrientName: "Fiber ",
                            nutrientValue: totalFiber.round().toString(),
                            nutrientPercent: totalFiber == 0
                                ? 0
                                : ((totalFiber / targetFiber) * 100)),
                      ],
                    ),
                  ),
                  buttonColor: AppColors().black),
            ),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            saveUserMeal();
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomeScreen()));
            // Navigator.of(context).pushAndRemoveUntil(
            //   MaterialPageRoute<void>(
            //       builder: (BuildContext context) => const homeScreen()),
            //   ModalRoute.withName('/'),
            // );
          },
          child: const Icon(Icons.save_alt_rounded)),
    );
  }
}
