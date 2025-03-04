import 'package:flutter/material.dart';

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
            Expanded( // Membantu teks menyesuaikan ruang yang tersedia
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Selamat Datang !',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Flexible( // Menghindari overflow jika teks terlalu panjang
                    child: Text(
                      userName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis, // Potong teks jika terlalu panjang
                      maxLines: 1, // Pastikan hanya satu baris
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10), // Beri sedikit jarak agar tidak berhimpitan
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
