import 'package:flutter/material.dart';
import 'package:helpme_slicing_task2/pages/page_login.dart';
import 'package:helpme_slicing_task2/pages/page_onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnboardingScreen(),
    );
  }
}