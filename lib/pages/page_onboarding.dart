import 'package:flutter/material.dart';
import 'package:helpme_slicing_task2/pages/page_login.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/logo_onboarding.png', 
                  width: 150,
                ),
                const SizedBox(height: 20),
                const Text(
                  'HelpMe',
                  style: TextStyle(
                    fontSize: 68,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5,
                    color: Colors.red,
                    shadows: [
                      Shadow(
                        color: Colors.black26,
                        offset: Offset(2, 2),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Aplikasi Layanan Darurat Indonesia',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 120), 
          Padding(
            padding: const EdgeInsets.only(bottom: 120),
            child: ElevatedButton( 
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()), 
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:  Color(0xFFF81000),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15), 
              ),
              child: const Text(
                'Mulai !',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
