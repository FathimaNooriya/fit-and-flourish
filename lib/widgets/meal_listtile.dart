// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

//import 'dart:io';
import 'package:flutter/material.dart';
import '../db_functions/user_meal_db_fn.dart';
import '../functions/meal_fn.dart';
import '../screens/meal.dart';
import '../theme/fonds.dart';

class MealListtile extends StatelessWidget {
  const MealListtile(
      {super.key,
      this.mealImage,
      this.mealName,
      this.mealCalori,
      required this.index,
      required this.value});
  final mealImage;
  final mealName;
  final mealCalori;
  final index;
  final value;
  @override
  Widget build(BuildContext context) {
    getUserMealList();
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: ListTile(
        leading: SizedBox(
          height: 60,
          width: 60,
          child: Image.asset(
            mealImage,
          ),
          // Image(
          //   image: FileImage(File(
          //     mealImage,
          //   )),
          // ),
        ),
        //  Image.asset(
        //   mealImage,
        //   width: 70,
        // ),
        title: Center(
          child: Text(
            mealName,
            style: AppFonts().headding2grey,
          ),
        ),
        trailing: SizedBox(
          width: 95,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                mealCalori.round().toString(),
                style: AppFonts().headding2White,
              ),
              IconButton(
                onPressed: () {
                  mealAlertDialog(context, index, value);
                },
                icon: const Icon(Icons.delete),
                color: Colors.red,
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future mealAlertDialog(contextDialog, index, value) async {
  showDialog(
      context: contextDialog,
      builder: ((contextDialog) {
        return AlertDialog(
          title: const Text('Wannig'),
          content: const Text("Are you sure you want to Delete"),
          actions: [
            ElevatedButton(
                onPressed: () async {
                  deleteMealFunction(value, index);
                  Navigator.of(contextDialog).pushReplacement(MaterialPageRoute(
                    builder: (context) => MealScreen(),
                  ));
                },
                child: const Text("yes")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(contextDialog).pop();
                },
                child: const Text("no"))
          ],
        );
      }));
}
