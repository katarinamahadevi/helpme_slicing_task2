import 'package:flutter/material.dart';
import 'package:helpme_slicing_task2/pages/page_obrolan.dart';
import 'package:helpme_slicing_task2/pages/page_detailchat.dart';

class CustomAppBarDetailChat extends StatelessWidget implements PreferredSizeWidget {
  final IconData icon;
  final String title;
  final double height; // Menambahkan parameter tinggi agar fleksibel

  const CustomAppBarDetailChat({
    super.key,
    required this.icon,
    required this.title,
    this.height = 150, // Default tinggi jika tidak diatur
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: Container(
        height: height, // Pastikan tinggi sesuai dengan preferredSize
        decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: SafeArea( // Mencegah konten tertutup status bar
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Padding agar tidak mepet
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const PageObrolan()),
                          (Route<dynamic> route) => false,
                        );
                      },
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 5), // Jarak agar lebih rapi
                Icon(icon, color: Colors.white, size: 50),
                const SizedBox(height: 5),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
