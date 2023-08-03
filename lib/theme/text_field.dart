// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:healthy/theme/colors.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.validatorFn,
    // Function()? OnTap,
    required this.number,
  });
  final String hintText;
  final dynamic controller;
  dynamic Ontap;
  String? Function(String?)? validatorFn;
  bool number;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //  onTap: Ontap,
      controller: controller,
      keyboardType: number ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors().white),
            borderRadius: BorderRadius.circular(12)),
      ),

      validator: validatorFn,
    );
  }
}

// class TecxfieldDecoration {
//   final TextfieldDec = OutlineInputBorder(
//       borderSide: BorderSide(color: AppColors().black),
//       borderRadius: BorderRadius.circular(15));
// }
