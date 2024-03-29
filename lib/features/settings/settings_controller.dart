import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_node_js/common/widgets/custom_snackbars.dart';
import 'package:flutter_node_js/utils/helpers/network.dart';
import 'package:flutter_node_js/utils/http/request_codes.dart';
import 'package:flutter_node_js/utils/local/storage/local_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';

import '../../../data/repositories/auth_repository.dart';

class SettingsController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final TextEditingController userNameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController createdAtController;

  late final GlobalKey<FormState>? formState;
  late final RxBool passwordObscure, isLoading;
  late final RxString reSentTxt;
  late String _token, _id;
  late final GetStorage _storage;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    userNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    createdAtController = TextEditingController();
    isLoading = false.obs;
    passwordObscure = false.obs;
    reSentTxt = "".obs ;
    _token = "" ;
    _id = "" ;
    _storage = GetStorage();
    formState = GlobalKey<FormState>();
    init();
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  init() async {
    userNameController.text = await LocalStorage.read(key: "USERNAME", storage: _storage) ?? "";
    emailController.text = await LocalStorage.read(key: "EMAIL", storage: _storage) ?? "";
    passwordController.text = await LocalStorage.read(key: "PASSWORD", storage: _storage) ?? "";
    createdAtController.text = await LocalStorage.read(key: "CREATED_AT", storage: _storage) ?? "";
    _token = await LocalStorage.read(key: "TOKEN", storage: _storage) ?? "";
    _id = await LocalStorage.read(key: "ID", storage: _storage) ?? "";

    print("**********");
    print(_id);
    print("**********");
    print(_token);
    print("**********");
  }

  // - - - - - - - - - - - - - - - - - - ON UPDATE USER INFO - - - - - - - - - - - - - - - - - -  //
  Future<void> onUpdateUserInfo() async {

    try {

      /// CHECK THE NETWORK
      final bool hasNetwork = await _checkTheNetwork();
      if (!hasNetwork) return;

      /// CHECK FROM VALIDATION
      if (!formState!.currentState!.validate()) return;

      /// START LOADER
      isLoading.value = true;

      if(_id == "" && _token == "") {
        Get.back();
      }

      /// CREATE USER ACCOUNT
      final result = await AuthRepository.updateUserInfo(id: _id, userName: userNameController.text, password: passwordController.text, token: _token);
      if(result.statusCode != RequestCodes.OK){
        isLoading.value = false;
        CustomSnackBars.error(title: "Error ${result.statusCode}", message: json.decode(result.body)['message']);
        return;
      }

      /// STOP THE LOADER
      isLoading.value = false;

      /// NAVIGATE BACK
      CustomSnackBars.success(title: "Updated Successfully", message: "your information  updated by success!");

    } catch (error) {
      isLoading.value = false;
      CustomSnackBars.error(title: "Error 404", message: error.toString());
    }
  }

  // - - - - - - - - - - - - - - - - - - CHECK THE NETWORK - - - - - - - - - - - - - - - - - -  //
  Future<bool> _checkTheNetwork() async {
    final hasNetwork = await Network.hasConnection();
    if (!hasNetwork) {
      CustomSnackBars.error(
          icon: Iconsax.wifi,
          title: "No internet connection",
          message: "please check your network device.");
      return false;
    }
    return true;
  }

  // - - - - - - - - - - - - - - - - - - NAVIGATE TO LOGIN SCREEN - - - - - - - - - - - - - - - - - -  //
  onNavToLoginScreen(){
    Get.back();
  }

  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    formState = null;
    passwordObscure.close();
  }
}
