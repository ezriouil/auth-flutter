import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_node_js/common/widgets/custom_snackbars.dart';
import 'package:flutter_node_js/features/auth/sign_up/re_sent_email_verification_link_screen.dart';
import 'package:flutter_node_js/utils/helpers/network.dart';
import 'package:flutter_node_js/utils/http/request_codes.dart';
import 'package:flutter_node_js/utils/local/storage/local_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';

import '../../../data/repositories/auth_repository.dart';

class SignUpController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final TextEditingController userNameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  late final GlobalKey<FormState>? formState;
  late final RxBool passwordObscure, checkbox, isLoading;
  late final RxString reSentTxt;
  late final GetStorage _storage;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    userNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    checkbox = true.obs;
    isLoading = false.obs;
    reSentTxt = "".obs ;
    passwordObscure = true.obs;
    _storage = GetStorage();
    formState = GlobalKey<FormState>();
  }

  // - - - - - - - - - - - - - - - - - - CREATE ACCOUNT BY EMAIL AND PASSWORD - - - - - - - - - - - - - - - - - -  //
  Future<void> onCreateAccount() async {

    try {

      /// CHECK THE NETWORK
      final bool hasNetwork = await _checkTheNetwork();
      if (!hasNetwork) return;

      /// CHECK FROM VALIDATION
      if (!formState!.currentState!.validate()) return;

      /// START LOADER
      isLoading.value = true;

      /// CREATE USER ACCOUNT
      final result = await AuthRepository.signUp(userName: userNameController.text, email: emailController.text, password: passwordController.text);
      if(result.statusCode != RequestCodes.CREATED){
        isLoading.value = false;
        CustomSnackBars.error(title: "Error ${result.statusCode}", message: json.decode(result.body)['message']);
        return;
      }
      /// SAVE EMAIL AND PASSWORD INTO LOCAL STORAGE
      await LocalStorage.upsert(key: "USERNAME", value: userNameController.text, storage: _storage);
      await LocalStorage.upsert(key: "EMAIL", value: emailController.text, storage: _storage);
      await LocalStorage.upsert(key: "PASSWORD", value: passwordController.text, storage: _storage);

      /// STOP THE LOADER
      isLoading.value = false;

      /// NAVIGATE TO LOGIN SCREEN
      Get.off(()=>const ReSentEmailVerificationLinkScreen());

      // await Future.delayed(const Duration(milliseconds: 5000));
      // reSentTxt.value = "Re-sent link";

    } catch (error) {
      isLoading.value = false;
      CustomSnackBars.error(title: "Error 404", message: error.toString());
    }
  }

  // - - - - - - - - - - - - - - - - - - RE SENT LINK VERIFICATION - - - - - - - - - - - - - - - - - -  //
  // Future<void> reSentLink() async {
  //
  //   /// CHECK THE NETWORK
  //   final bool hasNetwork = await _checkTheNetwork();
  //   if (!hasNetwork) return;
  //
  //   /// RE SEND EMAIL VERIFICATION LINK
  //   final result = await AuthRepository.reSentEmailVerificationLink(email: emailController.text);
  //   if(result.statusCode != RequestCodes.OK){
  //     CustomSnackBars.error(title: "Error ${result.statusCode}", message: json.decode(result.body)['message']);
  //     return;
  //   }
  //
  //   CustomSnackBars.success(title: "Email Verification Sent", message:"Please check you index for verify your account.");
  //   await Future.delayed(const Duration(milliseconds: 3100));
  //
  //   Get.offAll( () => const LoginScreen());
  //
  // }

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
    checkbox.close();
    passwordObscure.close();
  }
}
