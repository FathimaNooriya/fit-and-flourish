import 'dart:io';
import 'package:flutter/material.dart';
import 'package:healthy/screens/weight_goal.dart';
import 'package:healthy/widgets/button.dart';
import 'package:image_picker/image_picker.dart';
import '../db_functions/weight_db_fn.dart';
import '../functions/first_page_fn.dart';
import '../functions/weight_fn.dart';
import '../theme/colors.dart';
import '../theme/fonds.dart';
import '../widgets/appbar.dart';
import '../widgets/bargraph.dart';
import 'home.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({super.key});

  @override
  State<WeightScreen> createState() => _weightScreenState();
}

// ignore: camel_case_types
class _weightScreenState extends State<WeightScreen> {
  @override
  Widget build(BuildContext context) {
    getWeightList();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors().black,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 510,
                child: Column(children: [
                  AppbarWigget(
                    appTitle: "Weight...",
                    iconThere: true,
                    function: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ));
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ButtonWidget(
                      myText: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ListTile(
                          leading: Image.asset("assets/images/weight11.png"),
                          title: Text(
                            "$goalCalegory ${weightDifferece.toStringAsFixed(1)} kg",
                            style: AppFonts().headding2White,
                          ),
                          subtitle: Text(
                            "$reminingWeeks weeks remaining",
                            style: AppFonts().normalTextWhite,
                          ),
                          trailing: SizedBox(
                            width: 70,
                            child: ButtonWidget(
                              buttonColor: AppColors().white,
                              myText: Text(
                                "Edit",
                                style: AppFonts().normalTextBlack,
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const WeightGoalScreen(),
                            ));
                          },
                        ),
                      ),
                      buttonColor: AppColors().black),
                  const SizedBox(
                    height: 7,
                  ),
                  ButtonWidget(
                      myText: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Weight",
                              style: AppFonts().headding2black,
                            ),
                            IconButton(
                                onPressed: () {
                                  weightInaDay();
                                  setState(() {});
                                },
                                icon: const Icon(Icons.remove_circle_rounded)),
                            Text(
                              "$todaysWeight",
                              style: AppFonts().headding2black,
                            ),
                            IconButton(
                                onPressed: () {
                                  addWeight = true;
                                  weightInaDay();
                                  setState(() {});
                                },
                                icon: const Icon(
                                  Icons.add_circle_rounded,
                                )),
                          ]),
                      buttonColor: AppColors().blue),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 240,
                    width: 300,
                    //color: AppColors().pink,
                    child: BarGraphWidget(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Timeline",
                    style: AppFonts().headding2White,
                  ),
                ]),
              ),
              weightList.value.isEmpty
                  ? ButtonWidget(
                      buttonColor: AppColors().black,
                      myText: ListTile(
                        title: Text(
                          weeklyRate,
                          style: AppFonts().headding2White,
                        ),
                        subtitle: Text(
                          DateTime.now().toString(),
                          style: AppFonts().normalTextWhite,
                        ),
                        trailing: const SizedBox(
                            width: 150,
                            height: 80,
                            child: Icon(Icons.account_box_outlined)

                            // Image(
                            //     image: FileImage(File(weightImage!.path))),
                            ),
                        // const Icon(Icons.account_box_outlined),
                      ),
                    )
                  :
                  // CustomScrollView(
                  //     slivers: [
                  //       SliverList(delegate:
                  //           SliverChildBuilderDelegate((context, index) {

                  //       }))
                  //     ],
                  //   ),

                  SizedBox(
                      height: 150,
                      child: Expanded(
                        child: ListView.builder(
                            // physics: NeverScrollableScrollPhysics(),
                            // scrollDirection: Axis.horizontal,
                            itemCount: weightList.value.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final weightData = weightList.value[index];
                              return ButtonWidget(
                                  buttonColor: AppColors().black,
                                  myText: SizedBox(
                                      // width: 100,
                                      height: 70,
                                      child:
                                          // Column(
                                          //         children: [
                                          //           weightImage == null
                                          //               ? Icon(Icons.account_box_outlined)
                                          //               : Image(
                                          //                   image: FileImage(File(
                                          //                       weightData.weightImage!))),
                                          //           Text(weightData.weightDate.toString()),
                                          //         ],
                                          //       ),
                                          //     ),
                                          ListTile(
                                        title: Text(
                                          weightData.weightTargetTime,
                                          style: AppFonts().headding2White,
                                        ),
                                        subtitle: Text(
                                          weightData.weightDate.toString(),
                                          style: AppFonts().normalTextWhite,
                                        ),
                                        trailing: SizedBox(
                                          width: 50,
                                          height: 100,
                                          child: weightImage == null
                                              ? const Icon(
                                                  Icons.account_box_outlined)
                                              : Image(
                                                  image: FileImage(File(
                                                      weightData
                                                          .weightImage!))),
                                          // Image(
                                          //     image: FileImage(File(weightImage!.path))),
                                        ),
                                      )),
                                  // const Icon(Icons.account_box_outlined),

                                  onTapFunction: () {
                                    showDialog(
                                        context: context,
                                        builder: ((
                                          context,
                                        ) {
                                          return AlertDialog(
                                              title: Text(
                                                  weightData.weightTargetTime),
                                              content: SizedBox(
                                                width: 300,
                                                child: weightImage == null
                                                    ? const Icon(Icons
                                                        .account_box_outlined)
                                                    : Image(
                                                        image: FileImage(File(
                                                            weightData
                                                                .weightImage!))),
                                                // FileImage(
                                                //     File(weightImage!.path))),
                                              ),
                                              actions: [
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text("Back"),
                                                ),
                                              ]);
                                        }));
                                  });
                            }),
                      ),
                    ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 210,
                child: ButtonWidget(
                  myText: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Save",
                      style: AppFonts().normalTextBlack,
                    ),
                  ),
                  buttonColor: AppColors().white,
                  onTapFunction: () async {
                    await saveWeightDetails();
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
                  },
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await pickWeightImage(ImageSource.camera);
            setState(() {});
          },
          backgroundColor: AppColors().lavender2,
          child: const Icon(Icons.camera_alt),
        ),
      ),
    );
  }
}
