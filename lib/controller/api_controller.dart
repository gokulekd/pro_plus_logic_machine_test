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
  List<String> category = [
    'Living Room',
    'Kitchen',
    'Home Office',
    'Bed Room',
    'Cloths',
    'Shoes'
  ];
  RxInt categoryIndex = 0.obs;
  RxString? userEmail = "".obs;
  RxString? userPassword = "".obs;
  List<GetProductModel>? product;

  userLogin(String name, String password) async {
    if (name == "mor_2314" && password == "83r5^_") {
      final sharedPref = await SharedPreferences.getInstance();

      await sharedPref.setString("email", name);
     

      Map<String, dynamic> loginData = {
        "username": "mor_2314",
        "password": "83r5^_"
      };

      final response = await ApiServiceEndPoint().login(loginData);
      try {
        if (response!.statusCode == 200 || response.statusCode == 201) {
          final login = loginModelFromJson(response.data);

          if (login.token != null) {
            Get.off(const ScreeenHomePage());
            Get.snackbar(
              duration: const Duration(seconds: 3),
              'welcome cheif',
              'to check daily collection',
              colorText: Colors.green,
              snackPosition: SnackPosition.BOTTOM,
              padding: const EdgeInsets.all(20),
            );
            update();
          }
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
     
      if (response!.statusCode == 200 || response.statusCode == 201) {
        final datas = getProductModelFromJson(response.data);
        product = datas.obs;
        update();
      }
    } catch (e) {
      log(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$e");

      update();
    }
  }

  categorycolormanager(index) {
    categoryIndex = index;
    update();
  }

  Future<void> validateuser() async {
    log("villichu");
    final sharedPref = await SharedPreferences.getInstance();

    var email = sharedPref.getString("email");

    if (email != null) {
      print("data undu");
      Get.to(() => const ScreeenHomePage());
    } else {
      Get.to(ScreenSignUp());
    }

    update();
  }

  clearUser() async {
    final sharedpref = await SharedPreferences.getInstance();
    sharedpref.clear();
    Get.offAll(ScreenSignUp());
    Get.snackbar(
      duration: const Duration(seconds: 3),
      'Logout Successfull',
      'User has logged out Successfully',
      colorText: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
      padding: const EdgeInsets.all(20),
    );
    update();
  }

  @override
  void onInit() {
    // validateuser();

    getData();
    super.onInit();
    update();
  }
}
