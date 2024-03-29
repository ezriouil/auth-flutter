import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_node_js/common/widgets/custom_snackbars.dart';
import 'package:flutter_node_js/data/repositories/auth_repository.dart';
import 'package:flutter_node_js/features/auth/forget_password/reset_the_password.dart';
import 'package:flutter_node_js/features/auth/forget_password/verify_otp_code_screen.dart';
import 'package:flutter_node_js/features/auth/sign_up/sign_up_screen.dart';
import 'package:flutter_node_js/utils/helpers/network.dart';
import 'package:flutter_node_js/utils/http/request_codes.dart';
import 'package:flutter_node_js/utils/local/storage/local_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';

import '../login/login_screen.dart';

class ForgetPasswordController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final TextEditingController emailController;
  late final TextEditingController newPasswordController;
  late final TextEditingController confirmNewPasswordController;

  late final RxString otpCode;
  late final RxBool isLoading, passwordObscure;
  late final GetStorage storage;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmNewPasswordController = TextEditingController();
    storage = GetStorage();
    isLoading = false.obs;
    passwordObscure = false.obs;
    otpCode = "".obs;
    init();
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  init () async{
    emailController.text = await LocalStorage.read(key: "EMAIL", storage: storage) ?? "";
  }

  // - - - - - - - - - - - - - - - - - -  SEND OTP CODE - - - - - - - - - - - - - - - - - -  //
  Future<void> onSendOTPCode() async {

    try {
      /// CHECK THE NETWORK
      final bool hasNetwork = await _checkTheNetwork();
      if (!hasNetwork) return;

      /// CHECK FROM VALIDATION
      if (emailController.text.trim().length <= 6 && !emailController.text.contains("@")){
        CustomSnackBars.error(
            icon: Iconsax.direct_right,
            title: "Email Field",
            message: "please fill in the field !");
        return;
      }

      /// START LOADER
      isLoading.value = true;

      /// SEND OTP CODE
      final result = await AuthRepository.sendOTPCodeResetThePassword(email: emailController.text);
      if(result.statusCode != RequestCodes.OK){
        isLoading.value = false;
        CustomSnackBars.error(title: "Error ${result.statusCode}", message: json.decode(result.body)['message']);
        return;
      }

      /// STOP THE LOADER
      isLoading.value = false;

      /// NAVIGATE TO LOGIN SCREEN
      Get.offAll( () => const VerifyOTPCodeScreen());

    } catch (error) {
      isLoading.value = false;
      CustomSnackBars.error(title: "Error 404", message: error.toString());
    }
  }

  // - - - - - - - - - - - - - - - - - - VERIFY OTP CODE - - - - - - - - - - - - - - - - - -  //
  Future<void> onVerifyOTPCode() async {

    try {
      /// CHECK THE NETWORK
      final bool hasNetwork = await _checkTheNetwork();
      if (!hasNetwork) return;

      /// CHECK FROM VALIDATION
      if (otpCode.value.length < 4){
        CustomSnackBars.error(
            icon: Iconsax.direct_right,
            title: "OTP",
            message: "please fill in the fields !");
        return;
      }

      /// START LOADER
      isLoading.value = true;

      /// VERIFY OTP CODE
      final result = await AuthRepository.verifyOTPCodeResetThePassword(email: emailController.text, code: otpCode.value);
      if(result.statusCode != RequestCodes.OK){
        isLoading.value = false;
        CustomSnackBars.error(title: "Error ${result.statusCode}", message: json.decode(result.body)['message']);
        return;
      }

      /// STOP THE LOADER
      isLoading.value = false;

      /// NAVIGATE TO LOGIN SCREEN
      Get.offAll( () => const ResetThePasswordScreen());

    } catch (error) {
      isLoading.value = false;
      CustomSnackBars.error(title: "Error 404", message: error.toString());
    }
  }

  // - - - - - - - - - - - - - - - - - - UPDATE THE PASSWORD - - - - - - - - - - - - - - - - - -  //
  Future<void> onResetThePassword() async {

    try {

      /// CHECK THE NETWORK
      final bool hasNetwork = await _checkTheNetwork();
      if (!hasNetwork) return;

      /// CHECK FROM VALIDATION
      if (newPasswordController.text != confirmNewPasswordController.text){
        CustomSnackBars.error(
            icon: Iconsax.direct_right,
            title: "Password Is Not Matched",
            message: "please fill in the fields by the same password!");
        return;
      }

      /// START LOADER
      isLoading.value = true;

      ///  RESET THE PASSWORD
      final result = await AuthRepository.resetThePassword(email: emailController.text, newPassword: newPasswordController.text);
      if(result.statusCode != RequestCodes.OK){
        isLoading.value = false;
        CustomSnackBars.error(title: "Error ${result.statusCode}", message: json.decode(result.body)['message']);
        return;
      }

      /// SAVE NEW PASSWORD
      await LocalStorage.upsert(key: "PASSWORD", value: newPasswordController.value, storage: storage);

      /// STOP THE LOADER
      isLoading.value = false;

      /// STOP THE LOADER
      onNavToLoginScreen();

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
    Get.off(()=> const SignUpScreen());
  }

  // - - - - - - - - - - - - - - - - - - NAVIGATE TO LOGIN SCREEN - - - - - - - - - - - - - - - - - -  //
  onNavToLoginScreen(){
    Get.offAll(()=> const LoginScreen());
  }

  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }
}
