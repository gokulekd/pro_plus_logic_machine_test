import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pro_plus_logic_machine_test/view/screen_signup.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    navigation(context);
    return Scaffold(
      body: Center(
        child: SizedBox(
            width: 300,
            height: 300,
            child: Lottie.asset("assets/loadingJson.json")),
      ),
    );
  }
}

void navigation(context)async {
 await Future.delayed(const Duration(seconds: 3));
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) =>  ScreenSignUp(),
    ),
  );
}
