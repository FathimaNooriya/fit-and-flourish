import 'package:flutter/material.dart';
import 'package:healthy/screens/home.dart';
import 'package:healthy/theme/colors.dart';
import 'package:healthy/theme/fonds.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({super.key});

  @override
  State<StartingPage> createState() => _startingPageState();
}

// ignore: camel_case_types
class _startingPageState extends State<StartingPage> {
  @override
  void initState() {
    goToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().white,
      body: SafeArea(
          child: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(17),
                child: Text(
                  'Customizing the app for you...',
                  style: AppFonts().headdingBlack,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: 400,
                color: AppColors().white,
                child: Image.asset(
                  "assets/images/logo.gif",
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  Future<void> goToHome() async {
    await Future.delayed(const Duration(seconds: 7));
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: ((context) => const HomeScreen())));
  }
}
