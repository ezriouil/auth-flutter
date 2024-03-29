import 'package:flutter/material.dart';
import 'package:flutter_node_js/features/settings/settings_screen.dart';
import 'package:flutter_node_js/utils/constants/custom_colors.dart';
import 'package:flutter_node_js/utils/responsive/responsive.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends Responsive {
  const HomeScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Home Screen",
            style: Theme.of(context).textTheme.headlineLarge),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to( () => const SettingsScreen() ),
        backgroundColor: primaryColor(context),
        child: const Icon(Iconsax.setting, color: CustomColors.WHITE),
      ),
    );
  }
}
