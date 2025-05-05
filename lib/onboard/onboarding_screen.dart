import 'package:fitness/onboard/second_page.dart';
import 'package:fitness/onboard/third_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'first_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: const [
              FirstOnboardingPage(),
              SecondOnboardingPage(),
              ThirdOnboardingPage(),
            ],
          ),

          // Page Indicators
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 20 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? Colors.blue
                        : Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
          ),

          // Navigation Button
          Positioned(
            bottom: 40,
            right: 30,
            child: FloatingActionButton(
              onPressed: () async {
                if (_currentPage < 2) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                } else {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setBool('showOnboarding', true);
                  // Navigate to home screen
                  Navigator.pushReplacementNamed(context, '/home');
                }
              },
              child: Icon(
                _currentPage < 2 ? Icons.arrow_forward : Icons.check,
              ),
            ),
          ),
        ],
      ),
    );
  }
}