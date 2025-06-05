import 'package:flutter/material.dart';
import 'package:helpme_slicing_task2/widgets/navbar.dart';
import 'package:helpme_slicing_task2/widgets/appBar_home.dart'; 

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBar(
              userName: "Harry Potter",
              profileImagePath: "assets/profile_user.png",
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: const [
                  EmergencyButtonSection(),
                  SizedBox(height: 20),
                  EmergencyServicesSection(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
      floatingActionButton: const CustomFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}


class EmergencyButtonSection extends StatelessWidget {
  const EmergencyButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Sedang dalam kondisi darurat?",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text.rich(
          TextSpan(
            text: "Tap ",
            style: TextStyle(fontSize: 16, color: Colors.black54),
            children: [
              TextSpan(
                text: "Button Darurat",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              TextSpan(text: " di bawah ini"),
            ],
          ),
        ),
        const SizedBox(height: 30),
        GestureDetector(
          onTap: () => print("Tombol darurat ditekan!"),
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Center(
              child: Container(
                width: 90,
                height: 90,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: const Center(
                  child: Icon(Icons.touch_app, size: 40, color: Colors.white), 
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class EmergencyServicesSection extends StatelessWidget {
  const EmergencyServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Layanan Darurat",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 1,
            children: [
              _serviceCard("assets/ambulance.png", "Ambulance"),
              _serviceCard("assets/pemadam_kebakaran.png", "Pemadam Kebakaran"),
              _serviceCard("assets/police.png", "Polisi"),
              _serviceCard("assets/reparation.png", "Reparasi Kendaraan"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _serviceCard(String imagePath, String title) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(imagePath, width: 120, height: 120, fit: BoxFit.cover),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
