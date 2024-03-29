import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_node_js/common/widgets/custom_elevated_button.dart';
import 'package:flutter_node_js/common/widgets/custom_otp_field.dart';
import 'package:flutter_node_js/common/widgets/custom_outlined_button.dart';
import 'package:flutter_node_js/features/auth/forget_password/forget_password_controller.dart';
import 'package:flutter_node_js/utils/constants/custom_sizes.dart';
import 'package:flutter_node_js/utils/responsive/responsive.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class VerifyOTPCodeScreen extends Responsive {
  const VerifyOTPCodeScreen({super.key});

  @override
  Widget execute(BuildContext context) {

    // - - - - - - - - - - - - - - - - - - INSTANCE FROM THE CONTROLLER - - - - - - - - - - - - - - - - - -  //
    final ForgetPasswordController controller = Get.put(ForgetPasswordController());
    

    return Scaffold(
      appBar: AppBar(leading: InkWell(onTap: controller.onNavToLoginScreen, child: Icon(Iconsax.direct_left, color: darkLightColor(context))), title: const Text("Verification"), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: CustomSizes.SPACE_BETWEEN_ITEMS, vertical: CustomSizes.SPACE_DEFAULT),
          child: Column(
            children: [

              // - - - - - - - - - - - - - - - - - - TEXT - - - - - - - - - - - - - - - - - -  //
              Text("Enter Verification Code", style: Theme.of(context).textTheme.titleMedium),

              // - - - - - - - - - - - - - - - - - - OTP - - - - - - - - - - - - - - - - - -  //
              CustomOTPCode(onSubmit: (code){ controller.otpCode.value = code ;}),

              // - - - - - - - - - - - - - - - - - - TEXT + RESENT BUTTON - - - - - - - - - - - - - - - - - -  //
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("If you didn't receive the code, ", style: Theme.of(context).textTheme.bodySmall),
                  Text("Resent", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: primaryColor(context))),
                ],
              ),

              // - - - - - - - - - - - - - - - - - - BUTTON - - - - - - - - - - - - - - - - - -  //
              Obx(
                      ()=> controller.isLoading.value ? Container(alignment: Alignment.center, child: CircularProgressIndicator(color: primaryColor(context))) : CustomElevatedButton(
                        text: "Verify OTP",
                        onClick: controller.onVerifyOTPCode,
                        width: getWidth(context),
                        withDefaultPadding: false,
                      )
              ),

              // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS * 2),

              // - - - - - - - - - - - - - - - - - - TITLE - - - - - - - - - - - - - - - - - -  //
              Text("Do you have an account?", style: Theme.of(context).textTheme.bodySmall, maxLines: 2,overflow: TextOverflow.ellipsis),

              // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

              // - - - - - - - - - - - - - - - - - - SIGN UP BUTTON - - - - - - - - - - - - - - - - - -  //
              CustomOutlinedButton(text: "Sign Up", onClick: controller.onNavToSignUpScreen)
            ],
          ),
        ),
      ),
    );
  }
}