// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import '../theme/fonds.dart';

class AppbarWigget extends StatelessWidget {
  const AppbarWigget(
      {super.key,
      required this.appTitle,
      required this.iconThere,
      this.function,
      this.actions});
  final String appTitle;
  final bool iconThere;
  final function;
  final actions;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: AppBar(
        backgroundColor: const Color.fromARGB(255, 22, 0, 32),
        leading: iconThere
            ? IconButton(
                onPressed: function ?? () {
                        Navigator.of(context).pop();
                      },
                icon: const Icon(Icons.arrow_back))
            : const SizedBox(),
        title: Text(
          appTitle,
          style: AppFonts().headdingWhite,
        ),
        actions: actions,
      ),
    );
  }
}
