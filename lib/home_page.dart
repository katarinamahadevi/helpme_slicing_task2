import 'package:flutter/material.dart';
import 'package:helpme_slicing_task2/page_kontak.dart';
import 'package:helpme_slicing_task2/page_layanan.dart';
import 'package:helpme_slicing_task2/page_module.dart';
import 'package:helpme_slicing_task2/page_obrolan.dart';

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
              userName: "Kinan Artika Putri",
              profileImagePath: "assets/profile_user.png",
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,), // padding di kiri & kanan
              child: Column(
                children: const [
                  EmergencyButtonSection(), //button emergency
                  SizedBox(height: 20),
                  EmergencyServicesSection(), //card service
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(), //navbar home
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.white,
          elevation: 10,
          shape: const CircleBorder(
            side: BorderSide(color: Colors.red, width: 2.0),
          ),
          child: const Icon(Icons.home, color: Colors.red, size: 40),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class CustomAppBar extends StatelessWidget {
  final String userName;
  final String profileImagePath;

  const CustomAppBar({
    super.key,
    required this.userName,
    required this.profileImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 155,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      decoration: const BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Selamat Datang !',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  userName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                profileImagePath,
                width: 45,
                height: 45,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
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
            mainAxisSpacing: 5, // Jarak antar baris (vertikal)
            crossAxisSpacing: 5, // Jarak antar kolom (horizontal)
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

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          BottomNavItem(icon: Icons.menu_book, label: "Modul", page: PageModule(),),
          BottomNavItem(icon: Icons.contacts, label: "Kontak", page: PageKontak()),
          SizedBox(width: 50), // Untuk memberikan ruang bagi FloatingActionButton
          BottomNavItem(icon: Icons.support_agent, label: "Layanan", page: PageLayanan(),),
          BottomNavItem(icon: Icons.chat, label: "Obrolan", page: PageObrolan(),),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Widget page;

  const BottomNavItem({required this.icon, required this.label, required this.page, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 30),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
}
