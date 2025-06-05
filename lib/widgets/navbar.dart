import 'package:flutter/material.dart';
import 'package:helpme_slicing_task2/pages/page_kontak.dart';
import 'package:helpme_slicing_task2/pages/page_layanan.dart';
import 'package:helpme_slicing_task2/pages/page_module.dart';
import 'package:helpme_slicing_task2/pages/page_obrolan.dart';
import 'package:helpme_slicing_task2/pages/page_home.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80, 
      color: Colors.red, 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomNavItem(icon: Icons.menu_book, label: "Modul", page: ModulePage()),
          BottomNavItem(icon: Icons.contacts, label: "Kontak", page: PageKontak()),
          const SizedBox(width: 50), // Memberikan ruang untuk FAB
          BottomNavItem(icon: Icons.support_agent, label: "Layanan", page: PageLayanan()),
          BottomNavItem(icon: Icons.chat, label: "Obrolan", page: PageObrolan()),
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
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => page),
          (Route<dynamic> route) => false,
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

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          bottom: 0,
          child: Container(
            width: 90,
            height: 45,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
            ),
          ),
        ),
        SizedBox(
          width: 70,
          height: 70,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
                (Route<dynamic> route) => false,
              );
            },
            backgroundColor: Colors.white,
            elevation: 0,
            shape: const CircleBorder(
              side: BorderSide(color: Colors.red, width: 2.0),
            ),
            child: const Icon(Icons.home, color: Colors.red, size: 40),
          ),
        ),
      ],
    );
  }
}
