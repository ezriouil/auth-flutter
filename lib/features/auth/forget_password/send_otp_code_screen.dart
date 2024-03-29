import 'package:flutter/material.dart';
import 'package:flutter_node_js/common/widgets/custom_elevated_button.dart';
import 'package:flutter_node_js/common/widgets/custom_outlined_button.dart';
import 'package:flutter_node_js/common/widgets/custom_text_field.dart';
import 'package:flutter_node_js/features/auth/forget_password/forget_password_controller.dart';
import 'package:flutter_node_js/utils/constants/custom_image_strings.dart';
import 'package:flutter_node_js/utils/constants/custom_sizes.dart';
import 'package:flutter_node_js/utils/responsive/responsive.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SendOTPCodeScreen extends Responsive {
  const SendOTPCodeScreen({super.key});

  @override
  Widget execute(BuildContext context) {

    // - - - - - - - - - - - - - - - - - - INSTANCE FROM THE CONTROLLER - - - - - - - - - - - - - - - - - -  //
    final ForgetPasswordController controller = Get.put(ForgetPasswordController());
    

    return Scaffold(
      appBar: AppBar(leading: InkWell(onTap: Get.back, child: Icon(Iconsax.direct_left, color: darkLightColor(context))), title: const Text("Forget Password"), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: CustomSizes.SPACE_BETWEEN_ITEMS, vertical: CustomSizes.SPACE_DEFAULT),
          child: Column(
            children: [

              // - - - - - - - - - - - - - - - - - - IMAGE - - - - - - - - - - - - - - - - - -  //
              Image.asset(CustomImageStrings.SEND_EMAIL, height: 150, width: 150, color: primaryColor(context), colorBlendMode: BlendMode.color),

              // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

              // - - - - - - - - - - - - - - - - - - EMAIL - - - - - - - - - - - - - - - - - -  //
              CustomTextField(
                  leadingIcon: Iconsax.direct_right,
                  hint: "Email",
                  controller: controller.emailController,
                  textInputType: TextInputType.emailAddress),


              // - - - - - - - - - - - - - - - - - - BUTTON - - - - - - - - - - - - - - - - - -  //
              Obx(
                      ()=> controller.isLoading.value ? Container(alignment: Alignment.center, child: CircularProgressIndicator(color: primaryColor(context))) : CustomElevatedButton(
                        text: "Send OTP",
                        onClick: controller.onSendOTPCode,
                        width: getWidth(context),
                        withDefaultPadding: false,
                      )
              ),

              // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

              // - - - - - - - - - - - - - - - - - - SIGN IN TEXT BUTTON - - - - - - - - - - - - - - - - - -  //
              InkWell(onTap: controller.onNavToLoginScreen, child: Text("Back to sign in", style: Theme.of(context).textTheme.bodySmall)),

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
