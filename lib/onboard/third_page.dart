import 'package:flutter/material.dart';

class ThirdOnboardingPage extends StatelessWidget {
  const ThirdOnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/onboarding3.png', // Your custom illustration
            height: 250,
          ),
          const SizedBox(height: 40),
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              style: TextStyle(fontSize: 24, color: Colors.black),
              children: [
                TextSpan(text: 'Ready to '),
                TextSpan(
                  text: 'Get Started?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: const Text(
                'Join Now',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
            child: const Text(
              'Skip for now',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}