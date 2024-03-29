import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_node_js/common/widgets/custom_elevated_button.dart';
import 'package:flutter_node_js/common/widgets/custom_text_field.dart';
import 'package:flutter_node_js/features/auth/sign_up/sign_up_controller.dart';
import 'package:flutter_node_js/utils/constants/custom_icon_strings.dart';
import 'package:flutter_node_js/utils/constants/custom_sizes.dart';
import 'package:flutter_node_js/utils/extensions/validator.dart';
import 'package:flutter_node_js/utils/responsive/responsive.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignUpScreen extends Responsive {
  const SignUpScreen({super.key});

  @override
  Widget execute(BuildContext context) {

    // - - - - - - - - - - - - - - - - - - INSTANCE FROM THE CONTROLLER - - - - - - - - - - - - - - - - - -  //
    final SignUpController controller = Get.put(SignUpController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: CustomSizes.SPACE_BETWEEN_ITEMS, vertical: CustomSizes.SPACE_DEFAULT * 2),
          child: Form(
              key: controller.formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // - - - - - - - - - - - - - - - - - - IMAGE - - - - - - - - - - - - - - - - - -  //
                 Image.asset(CustomIconStrings.APP_LOGO, height: 70, width: 100,fit: BoxFit.cover, color: darkLightColor(context)),
                  
                  // - - - - - - - - - - - - - - - - - - GREETING - - - - - - - - - - - - - - - - - -  //
                  Text("Let's create new account", style: Theme.of(context).textTheme.bodySmall),

                  // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),

                  // - - - - - - - - - - - - - - - - - - TITLE - - - - - - - - - - - - - - - - - -  //
                  Text("Please fill in the form to continue", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold, letterSpacing: 0.8), maxLines: 2,overflow: TextOverflow.ellipsis),

                  // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                  const SizedBox(height: CustomSizes.SPACE_DEFAULT),

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
                      validator: (value) => Validator.validateEmailField(value),
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

                  // - - - - - - - - - - - - - - - - - - CHECKBOX - - - - - - - - - - - - - - - - - -  //
                  Row(
                      children: [
                    Obx(
                      () => Checkbox(
                          visualDensity: const VisualDensity(horizontal: - 2),
                          value: controller.checkbox.value,
                          onChanged: (value) => { controller.checkbox.value = !controller.checkbox.value }),
                    ),
                    Text.rich(TextSpan(
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          const TextSpan(text: "I agree to "),
                          TextSpan(
                              text: "cookies",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color: primaryColor(context),
                                      decorationColor: primaryColor(context))),
                          const TextSpan(text: " and "),
                          TextSpan(
                              text: "conditions",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color: primaryColor(context),
                                      decorationColor: primaryColor(context))),
                        ])),
                  ]
                  ),

                  // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                  // - - - - - - - - - - - - - - - - - - BUTTON - - - - - - - - - - - - - - - - - -  //
                  Obx(
                          ()=> controller.isLoading.value ? Container(alignment: Alignment.center, child: CircularProgressIndicator(color: primaryColor(context))) : CustomElevatedButton(
                            text: "Create Account",
                            onClick: controller.onCreateAccount,
                            width: getWidth(context),
                            withDefaultPadding: false,
                          )
                  ),

                  // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

                  // - - - - - - - - - - - - - - - - - - LOGIN - - - - - - - - - - - - - - - - - -  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Have an Account ?  ",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      InkWell(
                        onTap: controller.onNavToLoginScreen,
                        child: Text(
                          "Log In",
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: primaryColor(context))
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
