import 'package:flutter/material.dart';
import 'package:flutter_node_js/features/settings/settings_controller.dart';
import 'package:flutter_node_js/utils/constants/custom_sizes.dart';
import 'package:flutter_node_js/utils/responsive/responsive.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../common/widgets/custom_elevated_button.dart';
import '../../common/widgets/custom_text_field.dart';
import '../../utils/extensions/validator.dart';

class SettingsScreen extends Responsive {
  const SettingsScreen({super.key});

  @override
  Widget execute(BuildContext context) {

    // - - - - - - - - - - - - - - - - - - INSTANCE FROM THE CONTROLLER - - - - - - - - - - - - - - - - - -  //
    final SettingsController controller = Get.put(SettingsController());

    return Scaffold(
      appBar: AppBar(leading: InkWell(onTap: Get.back, child: Icon(Iconsax.direct_left, color: darkLightColor(context))), title: const Text("Settings"), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: CustomSizes.SPACE_BETWEEN_ITEMS, vertical: CustomSizes.SPACE_DEFAULT * 2),
          child: Form(
              key: controller.formState,
              child: Column(
                children: [

                  // - - - - - - - - - - - - - - - - - - USER NAME - - - - - - - - - - - - - - - - - -  //
                  CustomTextField(
                      leadingIcon: Iconsax.user_edit,
                      hint: "User name",
                      controller: controller.userNameController,
                      validator: (value) => Validator.validateEmptyField(
                          "User name", value)),

                  // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 8),

                  // - - - - - - - - - - - - - - - - - - EMAIL - - - - - - - - - - - - - - - - - -  //
                  CustomTextField(
                      leadingIcon: Iconsax.direct_right,
                      hint: "Email",
                      controller: controller.emailController,
                      readOnly: true,
                      validator: null,
                      textInputType: TextInputType.emailAddress),

                  // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 8),

                  // - - - - - - - - - - - - - - - - - - PASSWORD - - - - - - - - - - - - - - - - - -  //
                  Obx(
                        () => CustomTextField(
                      leadingIcon: Iconsax.password_check,
                      controller: controller.passwordController,
                      validator: (value) =>
                          Validator.validatePasswordField(value),
                      hint: "Password",
                      textInputType: TextInputType.visiblePassword,
                      obscureText: controller.passwordObscure.value,
                      trailingIcon: InkWell(
                        onTap: () => {
                          controller.passwordObscure.value = !controller.passwordObscure.value
                        },
                        child: Icon(
                            controller.passwordObscure.value ? Iconsax.eye_slash : Iconsax.eye,
                            color: grayColor(context)),
                      ),
                    ),
                  ),

                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 8),

                  // - - - - - - - - - - - - - - - - - - CREATE AT - - - - - - - - - - - - - - - - - -  //
                  CustomTextField(
                      leadingIcon: Icons.timer_outlined,
                      hint: "CreateAt",
                      controller: controller.createdAtController,
                      readOnly: true,
                      validator: null,
                      textInputType: TextInputType.text),

                  // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                  const SizedBox(height: CustomSizes.SPACE_DEFAULT),

                  // - - - - - - - - - - - - - - - - - - BUTTON - - - - - - - - - - - - - - - - - -  //
                  Obx(
                          ()=> controller.isLoading.value ? Container(alignment: Alignment.center, child: CircularProgressIndicator(color: primaryColor(context))) : CustomElevatedButton(
                        text: "Update Info",
                        onClick: controller.onUpdateUserInfo,
                        width: getWidth(context),
                        withDefaultPadding: false,
                      )
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
