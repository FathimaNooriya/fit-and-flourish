import 'package:flutter/material.dart';
import '../db_functions/admin_meal_db_fn.dart';

Future alertDialogWidget(contextDialog, index) async {
  showDialog(
      context: contextDialog,
      builder: ((contextDialog) {
        return AlertDialog(
          title: const Text('Wannig'),
          content: const Text("Are you sure you want to Delete"),
          actions: [
            ElevatedButton(
                onPressed: () async {
                  adminDeleteMeal(index);
                  Navigator.of(contextDialog).pop();
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
