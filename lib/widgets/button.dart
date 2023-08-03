// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:healthy/theme/colors.dart';

// ignore: must_be_immutable
class ButtonWidget extends StatelessWidget {
  ButtonWidget({
    required this.myText,
    this.onTapFunction,
    super.key,
    required this.buttonColor,
    this.onsecondry,
  });
  final Widget myText;
  final Color buttonColor;
  dynamic onTapFunction;
  final onsecondry;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: onsecondry,
      onTap: onTapFunction,
      child: SizedBox(
        width: double.infinity,
        child: Card(
          color: buttonColor,
          elevation: 5,
          // surfaceTintColor: AppColors().orange,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: AppColors().grey)),
          child: Center(child: myText),
        ),
      ),
    );
  }
}
