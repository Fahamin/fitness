import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';

class OnboardController extends GetxController {
  final RxInt currentPage = 0.obs;
  final PageController pageController = PageController();

  void onPageChanged(int index) {
  currentPage.value = index;
  }

  Future<void> completeOnboarding() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('showOnboarding', false);
  Get.offAllNamed(Routes.HOME);
  }

  void nextPage() {
  if (currentPage.value < 2) {
  pageController.nextPage(
  duration: 300.milliseconds,
  curve: Curves.easeIn,
  );
  } else {
  completeOnboarding();
  }
  }
}