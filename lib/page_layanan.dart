import 'package:flutter/material.dart';
import 'package:helpme_slicing_task2/page_kontak.dart';
import 'package:helpme_slicing_task2/page_module.dart';
import 'package:helpme_slicing_task2/page_obrolan.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PageLayanan(),
    
  ));
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
    {"name": "PLN", "number": "123"},
  ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          const Text(
            "Sedang dalam kondisi darurat?",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            "Tap button di bawah ini",
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 20),
          Center(
            child: GestureDetector(
              onTap: () {
                // Aksi ketika tombol darurat ditekan
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Icon(Icons.touch_app, color: Colors.white, size: 50),
                
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Layanan Darurat Indonesia",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Text(
            "$name = $number",
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.call, color: Colors.white),
            onPressed: () {
              // Aksi panggilan ke nomor darurat
            },
          ),
        ),
      ),
    );
  }
}
