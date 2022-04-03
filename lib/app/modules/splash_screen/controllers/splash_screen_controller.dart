import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo/app/data/model/task_model.dart';
import 'package:todo/app/modules/settings/controllers/settings_controller.dart';
import 'package:todo/app/theme/app_theme.dart';
import 'package:http/http.dart' as http;

class SplashScreenController extends GetxController
    with SingleGetTickerProviderMixin {
  // animation controller for lottie
  AnimationController? animationController;

  // initializing userData instance
  final userData = GetStorage();

  // store Login status
  bool? isLoggedIn;

  // function to set the user saved theme on start
  setTheme() {
    var control = Get.put(SettingsController());
    int n = control.themes.indexOf(userData.read('theme'));
    Get.changeTheme(appThemeData.values.elementAt(n));
  }

  // function to check loginStatus
  checkLogin() {
    isLoggedIn = userData.read('loginStatus');
  }

  List<Task> tasklist = [];

  init() async {
    var url = Uri.parse('https://gorest.co.in/public/v2/todos');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    var tasks = jsonDecode(response.body);
    for (var t in tasks) {
      Task task = Task();
      task.taskId = t['id'];
      task.userId = t['user_id'];
      task.taskTitle = t['title'];
      task.due = t['due_on'];
      task.status = t['status'];
      tasklist.add(task);
    }
  }

  @override
  void onInit() {
    super.onInit();
    userData.writeIfNull('theme', "Yellow Light");
    userData.writeIfNull('drinkWater', false);
    userData.writeIfNull('loginStatus', false);

    // spalsh animation config
    animationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    animationController!.forward();
    animationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController!.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController!.forward();
      }
    });
    checkLogin();
    init();
    Timer(
      Duration(milliseconds: 5500),
      () {
        if (isLoggedIn!) {
          Get.offNamed('/home');
        } else {
          Get.offNamed('/welcome');
        }
        // Get.offNamed(isLoggedIn! ? '/home' : '/welcome');
      },
    );
  }

  @override
  void onReady() async {
    super.onReady();
    await setTheme();
  }

  @override
  void onClose() async {
    animationController!.dispose();
    super.onClose();
  }
}
