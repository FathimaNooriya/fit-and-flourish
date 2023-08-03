// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:healthy/theme/colors.dart';
// import 'package:healthy/theme/fonds.dart';

// import '../functions/functions.dart';
// import '../screens/admin_login.dart';

// class choiceChipWidget extends StatefulWidget {
//   const choiceChipWidget({super.key});

//   @override
//   State<choiceChipWidget> createState() => _choiceChipWidgetState();
// }

// class _choiceChipWidgetState extends State<choiceChipWidget> {
//   @override
//   final List<String> _options = [
//     'Hi User..',
//     'Admin',
//   ];

//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: _options.map((option) {
//         return ChoiceChip(
//             label: selectedChoiceChip == option
//                 ? Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Text(
//                       option,
//                       style: const TextStyle(color: Colors.white),
//                     ),
//                   )
//                 : Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Text(
//                       option,
//                       style: const TextStyle(
//                           color: Color.fromARGB(255, 110, 108, 108)),
//                     ),
//                   ),
//             selected: selectedChoiceChip == option,
//             backgroundColor:
//                 selectedChoiceChip == option ? AppColors().lavender2 : null,
//             onSelected: (bool selected) {
//               setState(() {
//                 selectedChoiceChip = selected ? option : '';
//               });
//               if (selectedChoiceChip == "Admin") {
//                 Navigator.of(context).push(MaterialPageRoute(
//                   builder: (context) => adminLogin(),
//                 ));
//               }
//             },
//             selectedColor: AppColors().lavender2,
//             labelStyle: selectedChoiceChip == option
//                 ?
//                 // TextStyle(color: Colors.white)
//                 AppFonts().headdingWhite
//                 : //const TextStyle(color: Color.fromARGB(255, 197, 196, 196)),
//                 AppFonts().headdingWhite);
//       }).toList(),
//     );
//   }
// }
