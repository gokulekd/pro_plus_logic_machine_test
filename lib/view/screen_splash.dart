import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pro_plus_logic_machine_test/controller/api_controller.dart';

class ScreenSplash extends StatelessWidget {
  ScreenSplash({Key? key}) : super(key: key);
  final controller = Get.put(ApiController());
  @override
  Widget build(BuildContext context) {
    controller.validateuser();
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

// void navigation(context)async {
//  await Future.delayed(const Duration(seconds: 3));
//   Navigator.pushReplacement(
//     context,
//     MaterialPageRoute(
//       builder: (context) =>  ScreenSignUp(),
//     ),
//   );
// }
