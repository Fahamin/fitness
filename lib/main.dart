import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/routes/app_pages.dart';
import 'onboard/onboarding_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showOnboarding = prefs.getBool('showOnboarding') ?? true;

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: showOnboarding ? Routes.ONBOARD : Routes.HOME,
      getPages: AppPages.routes,
    ),
  );
}