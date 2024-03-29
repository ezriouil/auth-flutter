import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_node_js/common/widgets/custom_snackbars.dart';
import 'package:flutter_node_js/data/repositories/auth_repository.dart';
import 'package:flutter_node_js/features/auth/sign_up/sign_up_screen.dart';
import 'package:flutter_node_js/utils/helpers/network.dart';
import 'package:flutter_node_js/utils/http/request_codes.dart';
import 'package:flutter_node_js/utils/local/storage/local_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';

import '../../home/home_screen.dart';
import '../forget_password/send_otp_code_screen.dart';

class LoginController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  late final GlobalKey<FormState>? formState;
  late final RxBool passwordObscure, checkbox, isLoading;
  late final GetStorage _storage;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _storage = GetStorage();
    checkbox = true.obs;
    isLoading = false.obs;
    passwordObscure = true.obs;
    formState = GlobalKey<FormState>();
    init();
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  init () async{
    emailController.text = await LocalStorage.read(key: "EMAIL", storage: _storage) ?? "";
    passwordController.text =  await LocalStorage.read(key: "PASSWORD", storage: _storage) ?? "";
  }

  // - - - - - - - - - - - - - - - - - - CREATE ACCOUNT BY EMAIL AND PASSWORD - - - - - - - - - - - - - - - - - -  //
  Future<void> onLogin() async {

    try {

      /// CHECK THE NETWORK
      final bool hasNetwork = await _checkTheNetwork();
      if (!hasNetwork) return;

      /// CHECK FROM VALIDATION
      if (!formState!.currentState!.validate()) return;

      /// START LOADER
      isLoading.value = true;

      /// CREATE USER ACCOUNT
      final result = await AuthRepository.login(email: emailController.text, password: passwordController.text);
      if(result.statusCode != RequestCodes.OK){
        isLoading.value = false;
        CustomSnackBars.error(title: "Error ${result.statusCode}", message: json.decode(result.body)['message']);
        return;
      }

      /// SAVE INTO LOCAL STORAGE
      if(checkbox.isTrue){
        await LocalStorage.upsert(key: "USERNAME", value: json.decode(result.body)['userName'], storage: _storage);
        await LocalStorage.upsert(key: "EMAIL", value: emailController.text, storage: _storage);
        await LocalStorage.upsert(key: "PASSWORD", value: passwordController.text, storage: _storage);
        await LocalStorage.upsert(key: "ID", value: json.decode(result.body)['_id'], storage: _storage);
        await LocalStorage.upsert(key: "TOKEN", value: json.decode(result.body)['token'], storage: _storage);
        await LocalStorage.upsert(key: "CREATED_AT", value: json.decode(result.body)['createdAt'], storage: _storage);
      }

      print("**********");
      print(json.decode(result.body)['_id']);
      print("**********");
      print(json.decode(result.body)['token']);
      print("**********");

      /// STOP THE LOADER
      isLoading.value = false;

      /// NAVIGATE TO LOGIN SCREEN
      Get.offAll( () => const HomeScreen());

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

  // - - - - - - - - - - - - - - - - - - NAVIGATE TO SIGN UP SCREEN - - - - - - - - - - - - - - - - - -  //
  onNavToSignUpScreen(){
    Get.to(()=> const SignUpScreen());
  }

  // - - - - - - - - - - - - - - - - - - NAVIGATE TO FORGET PASSWORD SCREEN - - - - - - - - - - - - - - - - - -  //
  onNavToForgetPasswordScreen(){
    Get.to(()=> const SendOTPCodeScreen());
  }

  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    formState = null;
    checkbox.close();
    passwordObscure.close();
  }
}
