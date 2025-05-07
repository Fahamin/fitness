import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../onboard/first_page.dart';
import '../../../../onboard/second_page.dart';
import '../../../../onboard/third_page.dart';
import '../controllers/onboard_controller.dart';

class OnboardingScreen extends GetView<OnboardController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.onPageChanged,
            children: const [
              FirstOnboardingPage(),
              SecondOnboardingPage(),
              ThirdOnboardingPage(),
            ],
          ),

          // Page Indicators
          Obx(() => Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: controller.currentPage.value == index ? 20 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: controller.currentPage.value == index
                        ? Colors.blue
                        : Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
          )),

          // Skip Button
          Obx(() => controller.currentPage.value < 2
              ? Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: controller.completeOnboarding,
              child: const Text(
                'Skip',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          )
              : const SizedBox.shrink(),
          ),

          // Next Button
          Positioned(
            bottom: 40,
            right: 30,
            child: FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: controller.nextPage,
              child: Obx(() => Icon(
                controller.currentPage.value < 2
                    ? Icons.arrow_forward
                    : Icons.check,
                color: Colors.white,
              )),
            ),
          ),
        ],
      ),
    );
  }
}