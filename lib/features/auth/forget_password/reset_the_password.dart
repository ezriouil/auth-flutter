import 'package:flutter/material.dart';
import 'package:flutter_node_js/common/widgets/custom_elevated_button.dart';
import 'package:flutter_node_js/common/widgets/custom_text_field.dart';
import 'package:flutter_node_js/features/auth/forget_password/forget_password_controller.dart';
import 'package:flutter_node_js/utils/constants/custom_sizes.dart';
import 'package:flutter_node_js/utils/responsive/responsive.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/extensions/validator.dart';

class ResetThePasswordScreen extends Responsive {
  const ResetThePasswordScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    // - - - - - - - - - - - - - - - - - - INSTANCE FROM THE CONTROLLER - - - - - - - - - - - - - - - - - -  //
    // final ForgetPasswordController controller = Get.find<ForgetPasswordController>();
    final ForgetPasswordController controller = Get.put(ForgetPasswordController());

    return Scaffold(
      appBar:AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: CustomSizes.SPACE_BETWEEN_ITEMS,
              vertical: CustomSizes.SPACE_DEFAULT),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // - - - - - - - - - - - - - - - - - - RESET THE PASSWORD - - - - - - - - - - - - - - - - - -  //
              Text("Reset Password",
                  style: Theme.of(context).textTheme.headlineLarge),

              // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

              // - - - - - - - - - - - - - - - - - - LOREM - - - - - - - - - - - - - - - - - -  //
              Text("Enter your new password twice below to reset a new password",
                  style: Theme.of(context).textTheme.bodySmall),

              // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

              // - - - - - - - - - - - - - - - - - - TEXT NEW PASSWORD - - - - - - - - - - - - - - - - - -  //
              Text("Enter New Password",
                  style: Theme.of(context).textTheme.bodyMedium),

              // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),

              // - - - - - - - - - - - - - - - - - - PASSWORD - - - - - - - - - - - - - - - - - -  //
              Obx(
                () => CustomTextField(
                  leadingIcon: Iconsax.password_check,
                  controller: controller.newPasswordController,
                  validator: (value) => Validator.validatePasswordField(value),
                  hint: "Password",
                  textInputType: TextInputType.visiblePassword,
                  obscureText: controller.passwordObscure.value,
                  trailingIcon: InkWell(
                    onTap: () => {
                      controller.passwordObscure.value =
                          !controller.passwordObscure.value
                    },
                    child: Icon(
                        controller.passwordObscure.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye,
                        color: grayColor(context)),
                  ),
                ),
              ),

              // - - - - - - - - - - - - - - - - - - TEXT CONFIRM THE PASSWORD - - - - - - - - - - - - - - - - - -  //
              Text("Confirm Password",
                  style: Theme.of(context).textTheme.bodyMedium),

              // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),

              // - - - - - - - - - - - - - - - - - - PASSWORD - - - - - - - - - - - - - - - - - -  //
              Obx(
                () => CustomTextField(
                  leadingIcon: Iconsax.password_check,
                  controller: controller.confirmNewPasswordController,
                  validator: (value) => Validator.validatePasswordField(value),
                  hint: "Confirm Password",
                  textInputType: TextInputType.visiblePassword,
                  obscureText: controller.passwordObscure.value,
                  trailingIcon: InkWell(
                    onTap: () => {
                      controller.passwordObscure.value =
                          !controller.passwordObscure.value
                    },
                    child: Icon(
                        controller.passwordObscure.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye,
                        color: grayColor(context)),
                  ),
                ),
              ),

              // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

              // - - - - - - - - - - - - - - - - - - BUTTON - - - - - - - - - - - - - - - - - -  //
              Obx(() => controller.isLoading.value
                  ? Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                          color: primaryColor(context)))
                  : CustomElevatedButton(
                      text: "Send",
                      onClick: () => controller.onResetThePassword())),
            ],
          ),
        ),
      ),
    );
  }
}
