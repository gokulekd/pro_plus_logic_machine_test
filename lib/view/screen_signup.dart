import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pro_plus_logic_machine_test/constants/colors.dart';
import 'package:pro_plus_logic_machine_test/constants/sized_box.dart';
import 'package:pro_plus_logic_machine_test/view/home_page.dart';

class ScreenSignUp extends StatelessWidget {
  const ScreenSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          sizeH100,
          Center(
            child: SizedBox(
              height: 150,
              width: 150,
              child: Image.asset("assets/signup_user.png"),
            ),
          ),
          sizeH20,
          const Text(
            "Welcome Back",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
          ),
          sizeH20,
          const Text(
            "Sign to continue",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.grey),
          ),
          sizeH50,
          TextFormFiled(iconname: Icons.mail),
          TextFormFiled(
            iconname: Icons.lock,
          ),
          sizeH30,
          const Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 40.0),
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: green),
              ),
            ),
          ),
          sizeH30,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(400, 50), primary: green),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScreeenHomePage(),
                    ),
                  );
                },
                child: const Text(
                  "LOGIN",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold, color: white),
                )),
          ),
          sizeH30,
          RichText(
            text: TextSpan(
                text: 'Don\'t have an account? ',
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w500, color: black),
                children: <TextSpan>[
                  TextSpan(
                      text: ' create a new account',
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: green),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          log("thotteeee");

                          // navigate to desired screen
                        })
                ]),
          ),
        ],
      )),
    );
  }
}

// ignore: must_be_immutable
class TextFormFiled extends StatelessWidget {
  IconData iconname;
  TextFormFiled({
    Key? key,
    required this.iconname,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 60,
          width: 400,
          child: TextFormField(
            style: const TextStyle(
                fontSize: 20,
                color: green,
                decorationStyle: TextDecorationStyle.solid,
                fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.white,
              filled: true,
              prefixIcon: Icon(iconname, color: green),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(
                  color: Colors.white,
                  width: 3.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(
                  color:
                      const Color.fromARGB(255, 222, 213, 213).withOpacity(0.3),
                  width: 2.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
