import 'package:flutter/material.dart';

class FirstOnboardingPage extends StatelessWidget {
  const FirstOnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[50],
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.5),
                  blurRadius: 20,
                  spreadRadius: 5,
                )
              ],
            ),
            child: const Icon(Icons.rocket_launch, size: 80, color: Colors.white),
          ),
          const SizedBox(height: 40),
          const Text(
            'Launch Your Journey',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Get ready to explore amazing features that will transform your experience',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }
}