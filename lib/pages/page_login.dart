import 'package:flutter/material.dart';
import 'package:helpme_slicing_task2/pages/page_home.dart';
import 'page_register.dart'; //wajib kalo mau pindah2 page

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo_onboarding.png', width: 150),
            const SizedBox(height: 20),
            const Text( //teks helpme
              'HelpMe',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.red,
                letterSpacing: 5,
                shadows: [
                  Shadow(
                    color: Colors.black26,
                    offset: Offset(2, 2),
                    blurRadius: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Align( //isian textfield notelp
              alignment: Alignment.centerLeft, // 
              child: Text('Nomor Telepon', style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/ind_flag.png', width: 24),
                      const SizedBox(width: 8),
                      const Text('+62'),
                      const SizedBox(width: 10),
                      Container( //garis disebelah +62
                        width: 2,
                        height: 32,
                        color: Colors.black54,
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder( //border input
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Kata Sandi', style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 8),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text('Lupa Kata Sandi?', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Belum punya akun?'),
                TextButton(
                  child: const Text('Daftar', style: TextStyle(color: Colors.red)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const PageRegister()), //pindah halaman register
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke HomePage setelah tombol "Daftar" ditekan
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()), //pindah halaman onpage
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
              ),
              child: 
              const Text(
                'Masuk',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
