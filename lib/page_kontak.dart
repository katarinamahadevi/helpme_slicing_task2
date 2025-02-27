import 'package:flutter/material.dart';
import 'package:helpme_slicing_task2/home_page.dart';


void main() {
  runApp(const PageKontak());
}

class PageKontak extends StatelessWidget {
  const PageKontak({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EmergencyContactsPage(),
    );
  }
}

class EmergencyContactsPage extends StatelessWidget {
  EmergencyContactsPage({super.key});

  final List<Map<String, String>> contacts = [
    {
      "name": "Kurniawan Setyanto",
      "relation": "Adik Kandung",
      "phone": "082234516722",
      "image": "assets/kontak_satu.png"
    },
    {
      "name": "Kirana Cantika",
      "relation": "Kakak Kandung",
      "phone": "089677813244",
      "image": "assets/kontak_dua.png"
    },
    {
      "name": "Kirana Cantika",
      "relation": "Kakak Kandung",
      "phone": "089677813244",
      "image": "assets/kontak_dua.png"
    },
    {
      "name": "Kirana Cantika",
      "relation": "Kakak Kandung",
      "phone": "089677813244",
      "image": "assets/kontak_dua.png"
    },
    {
      "name": "Kirana Cantika",
      "relation": "Kakak Kandung",
      "phone": "089677813244",
      "image": "assets/kontak_dua.png"
    },
    {
      "name": "Kirana Cantika",
      "relation": "Kakak Kandung",
      "phone": "089677813244",
      "image": "assets/kontak_dua.png"
    },
    {
      "name": "Kirana Cantika",
      "relation": "Kakak Kandung",
      "phone": "089677813244",
      "image": "assets/kontak_dua.png"
    },
    {
      "name": "Kirana Cantika",
      "relation": "Kakak Kandung",
      "phone": "089677813244",
      "image": "assets/kontak_dua.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(160),
        child: AppBar(
          backgroundColor: Colors.red,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
            onPressed: () {Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );} ,
          ),
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(height: 40),
              Icon(Icons.perm_contact_calendar, color: Colors.white, size: 60),
              SizedBox(height: 10),
              Text(
                "Kontak Darurat",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Cari...",
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.grey[300],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.red,
                  child: const Icon(Icons.add, color: Colors.white, size: 40),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: contacts.map((contact) {
                    return ContactCard(
                      name: contact["name"]!,
                      relation: contact["relation"]!,
                      phone: contact["phone"]!,
                      image: contact["image"]!,
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final String name;
  final String relation;
  final String phone;
  final String image;

  const ContactCard({
    required this.name,
    required this.relation,
    required this.phone,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(image),
            radius: 40,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  relation,
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
                Text(
                  phone,
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.call, size: 30, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
