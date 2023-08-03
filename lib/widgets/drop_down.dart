import 'package:flutter/material.dart';
import 'package:healthy/functions/burn_fn.dart';
import 'package:healthy/theme/colors.dart';
import '../functions/admin_functions.dart';
import '../functions/first_page_fn.dart';
import '../functions/functions.dart';

// ignore: must_be_immutable
class DropDownWidget extends StatefulWidget {
  DropDownWidget(
      {super.key, required this.dropDownlist, required this.dropdownValue});
  final List<String> dropDownlist;
  String dropdownValue;

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

//List<String> list = <String>['Slow', 'Moderate', 'Fast', 'Custom'];

class _DropDownWidgetState extends State<DropDownWidget> {
  // String dropdownValue = widget.dropDownlist.first;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      color: AppColors().grey,
      child: DropdownButton<String>(
        dropdownColor: const Color.fromARGB(232, 255, 255, 255),
        value: widget.dropdownValue,
        style: TextStyle(
          color: AppColors().black,
        ),
        alignment: Alignment.centerLeft,
        icon: Align(
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.arrow_drop_down,
            color: AppColors().black,
          ),
        ),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            widget.dropdownValue = value!;
            widget.dropDownlist.contains("Male")
                ? genterValue = value
                : widget.dropDownlist.contains("Brakefast")
                    ? adminDropDownValue = value
                    : widget.dropDownlist.contains("Sedentary")
                        ? activity = value
                        : widget.dropDownlist.contains("Weight Loss")
                            ? yourGoal = value
                            : widget.dropDownlist.contains("Lose 1Kg/week")
                                ? weeklyRate = value
                                : widget.dropDownlist.contains("Gain 1Kg/week")
                                    ? weeklyRate = value
                                    : widget.dropDownlist
                                            .contains("Slow (8 km/h)")
                                        ? speed = value
                                        : widget.dropDownlist
                                                .contains('Slow (3.2 km/h)')
                                            ? speed = value
                                            : widget.dropDownlist.contains(
                                                    "Leisurely biking(16 km/h)")
                                                ? speed = value
                                                : speed = value;
            // widget.dropDownlist
            //         .contains("Light")
            //     ? speed = value
            //     : print("value");
          });
        },
        items:
            widget.dropDownlist.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: SizedBox(
              width: 250,
              child: Text(
                value,
                style: TextStyle(color: AppColors().black),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
