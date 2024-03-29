import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_node_js/features/auth/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'utils/theme/theme_app.dart';

void main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeApp.lightTheme,
      darkTheme: ThemeApp.darkTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: RootBinding(),
      home: const LoginScreen()));
}


/* ------ INIT DEPENDENCIES ------ */ 
class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(Connectivity());
  }
}