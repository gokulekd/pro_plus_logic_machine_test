import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro_plus_logic_machine_test/model/login_model.dart';
import 'package:pro_plus_logic_machine_test/model/product_model.dart';
import 'package:pro_plus_logic_machine_test/service/api_service.dart';
import 'package:pro_plus_logic_machine_test/view/home_page.dart';
import 'package:pro_plus_logic_machine_test/view/screen_signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiController extends GetxController {
  RxString? userEmail = "".obs;
  RxString? userPassword = "".obs;
  List<GetProductModel>? product;
  userLogin(String name, String password) async {
    if (name == "mor_2314" && password == "83r5^_") {
      final sharedPref = await SharedPreferences.getInstance();
      await sharedPref.setString("email", name);
      await sharedPref.setString("password", password);
      Map<String, dynamic> loginData = {
        "username": "mor_2314",
        "password": "83r5^_"
      };

      final response = await ApiServiceEndPoint().login(loginData);
      try {
        if (response!.statusCode == 200 || response.statusCode == 201) {
          loginModelFromJson(response.data);
          Get.off(const ScreeenHomePage());

          Get.snackbar(duration: const Duration(seconds: 3),
            'welcome cheif',
            'to check daily collection',
            colorText: Colors.green,
            snackPosition: SnackPosition.BOTTOM,
            padding: const EdgeInsets.all(20),
          );
          update();
        } else {
          Get.snackbar(
            duration: const Duration(seconds: 3),
            'Login Error',
            'entered null response',
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.red,
          );
          update();
        }
      } catch (e) {
        Get.snackbar(
          duration: const Duration(seconds: 3),
          'Login Error',
          'entered null response',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.red,
        );
        log(e.toString());
        update();
      }
    }
    update();
  }

  getData() async {
    try {
      final response = await ApiServiceEndPoint().getProduct();
      log(response.toString());
      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = getProductModelFromJson(response.data);
        product = datas.obs;
        update();
      }
    } catch (e) {
      log(e.toString());
      update();
    }
  }

  Future<void> validateuser() async {
    final sharedPref = await SharedPreferences.getInstance();

    var email = sharedPref.getString("email");
    var password = sharedPref.getString("password");
    userEmail!.value = email.toString();
    userPassword!.value = password.toString();
    update();
  }

  @override
  void onInit() {
    validateuser()
        .whenComplete(() => Timer(Duration(microseconds: 100), () async {
              userEmail!.value == null && userPassword!.value == null
                  ? Get.to(() => ScreenSignUp())
                  : Get.to(() => const ScreeenHomePage());
            }));
    getData();
    super.onInit();
    update();
  }
}
