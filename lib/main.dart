import 'package:flutter/material.dart';
import 'package:helpme_slicing_task2/page_login.dart';

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
                  'assets/logo_onboarding.png', //Logo
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
          const SizedBox(height: 120), // Jarak fleksibel antara teks dan tombol
          Padding(
            padding: const EdgeInsets.only(bottom: 120),
            child: ElevatedButton( //button mulai
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()), //button pindah ke halaman login
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
