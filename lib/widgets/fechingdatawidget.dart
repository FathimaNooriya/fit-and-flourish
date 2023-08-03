// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../theme/fonds.dart';
import '../theme/text_field.dart';

class FechingDataWidget extends StatelessWidget {
  FechingDataWidget(
      {super.key,
      required this.data,
      required this.unit,
      this.controller,
      this.validator});
  final String data;
  final String unit;
  final dynamic controller;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            width: 220,
            child: TextFieldWidget(
              number: true,
              hintText: data,
              controller: controller,
              validatorFn: validator,
            )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            unit,
            style: AppFonts().normalTextWhite,
          ),
        )
      ],
    );
  }
}
