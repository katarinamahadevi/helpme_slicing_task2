import 'package:flutter/material.dart';
import 'package:helpme_slicing_task2/home_page.dart';
import 'package:helpme_slicing_task2/page_kontak.dart';
import 'package:helpme_slicing_task2/page_module.dart';
import 'package:helpme_slicing_task2/page_obrolan.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()),
  );
}

class PageLayanan extends StatelessWidget {
  const PageLayanan({super.key});

  // Daftar layanan darurat sebagai konstanta statis
  static const List<Map<String, String>> emergencyServices = [
    {"name": "Ambulans", "number": "118 atau 119"},
    {"name": "Pemadam Kebakaran", "number": "113"},
    {"name": "Polisi", "number": "110"},
    {"name": "SAR/BASARNAS", "number": "115"},
    {"name": "Posko Kewaspadaan Nasional", "number": "122"},
    {"name": "Posko Bencana Alam", "number": "129"},
    {"name": "Hotline Covid", "number": "119"},
    {"name": "PMI", "number": "021 7992325"},
    {"name": "Informasi Keracunan BPOM", "number": "1500-533"},
    {"name": "Panggilan Darurat", "number": "112"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          const SizedBox(height: 60),
          const Text(
            "Sedang dalam kondisi darurat?",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
            "Tap button di bawah ini",
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 20),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
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
                ),
                GestureDetector(
                  onTap: () => print("Tombol darurat ditekan!"),
                  child: Container(
                    width:
                        80, // Lebih kecil dari background putih agar terlihat
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.touch_app,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Layanan Darurat Indonesia",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
                bottom: 40,
              ), // Tambahkan bottom padding
              itemCount: emergencyServices.length,
              itemBuilder: (context, index) {
                final service = emergencyServices[index];
                return EmergencyServiceList(
                  name: service["name"]!,
                  number: service["number"]!,
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(), //Navbar Home
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
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

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:  [
          BottomNavItem(
            icon: Icons.menu_book,
            label: "Modul",
            page: ModulePage(),
          ),
          BottomNavItem(
            icon: Icons.contacts,
            label: "Kontak",
            page: PageKontak(),
          ),
          SizedBox(
            width: 50,
          ), // Untuk memberikan ruang bagi FloatingActionButton
          BottomNavItem(
            icon: Icons.support_agent,
            label: "Layanan",
            page: PageLayanan(),
          ),
          BottomNavItem(
            icon: Icons.chat,
            label: "Obrolan",
            page: PageObrolan(),
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Widget page;

  const BottomNavItem({
    required this.icon,
    required this.label,
    required this.page,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 30),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class EmergencyServiceList extends StatelessWidget {
  final String name;
  final String number;

  const EmergencyServiceList({
    required this.name,
    required this.number,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          title: Text(
            "$name = $number",
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          trailing: IconButton(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            icon: const Icon(Icons.call, color: Colors.white),
            onPressed: () {
              _makePhoneCall(sanitizedNumber(number));
            },
          ),
        ),
      ),
    );
  }

  void _makePhoneCall(String number) async {
    final Uri phoneUri = Uri.parse("tel:$number");

    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      print("Tidak dapat membuka aplikasi telepon.");
    }
  }

  String sanitizedNumber(String number) {
    return number.split(" atau ")[0]; // Ambil angka pertama sebelum "atau"
  }
}
