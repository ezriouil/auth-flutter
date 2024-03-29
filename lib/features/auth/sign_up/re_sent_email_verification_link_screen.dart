import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_node_js/features/auth/login/login_screen.dart';
import 'package:flutter_node_js/features/auth/sign_up/sign_up_controller.dart';
import 'package:flutter_node_js/utils/constants/custom_image_strings.dart';
import 'package:flutter_node_js/utils/constants/custom_sizes.dart';
import 'package:flutter_node_js/utils/responsive/responsive.dart';
import 'package:get/get.dart';

class ReSentEmailVerificationLinkScreen extends Responsive {
  const ReSentEmailVerificationLinkScreen({super.key});

  @override
  Widget execute(BuildContext context) {

    // - - - - - - - - - - - - - - - - - - INSTANCE FROM THE CONTROLLER - - - - - - - - - - - - - - - - - -  //
    //final SignUpController controller = Get.find();
    //

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: CustomSizes.SPACE_BETWEEN_ITEMS, vertical: CustomSizes.SPACE_DEFAULT * 2),
          child: Column(
            children: [

              // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
              const SizedBox(height: CustomSizes.SPACE_DEFAULT),

              // - - - - - - - - - - - - - - - - - - IMAGE - - - - - - - - - - - - - - - - - -  //
              Image.asset(CustomImageStrings.CONGRATS, height: 200, width: 200),

              // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
              const SizedBox(height: CustomSizes.SPACE_DEFAULT),

              // - - - - - - - - - - - - - - - - - - GREETING - - - - - - - - - - - - - - - - - -  //
              Text("Congratulations", style: Theme.of(context).textTheme.headlineLarge),

              // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

              // - - - - - - - - - - - - - - - - - - TITLE - - - - - - - - - - - - - - - - - -  //
              Text("We've send you a verification email, please check your index and follow the instruction to verify your account.\n\nThank you for signing up with us!", style: Theme.of(context).textTheme.bodySmall, textAlign: TextAlign.center,),

              // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS * 2),

              // - - - - - - - - - - - - - - - - - - RE SENT THE LINK - - - - - - - - - - - - - - - - - -  //
              // InkWell(
              //   onTap: controller.reSentLink,
              //   child: Obx( ()=> Text(controller.reSentTxt.value,
              //         style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: primaryColor(context))
              //     ),
              //   ),
              // ),

              // - - - - - - - - - - - - - - - - - - LOGIN HERE - - - - - - - - - - - - - - - - - -  //
              InkWell(
                onTap: ()=>Get.offAll( ()=> const LoginScreen()),
                child: Text("Login here",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: primaryColor(context))
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
