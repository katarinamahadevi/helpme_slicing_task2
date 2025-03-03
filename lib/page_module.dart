import 'package:flutter/material.dart';
import 'package:helpme_slicing_task2/models/datamodule_model.dart';
import 'package:helpme_slicing_task2/home_page.dart';
import 'package:helpme_slicing_task2/page_detailmodule.dart';
import 'package:helpme_slicing_task2/page_kontak.dart';
import 'package:helpme_slicing_task2/page_obrolan.dart';
import 'package:helpme_slicing_task2/page_layanan.dart';
import 'package:helpme_slicing_task2/models/detailmodule_model.dart';


class ModulePage extends StatefulWidget {
  @override
  _ModulePageState createState() => _ModulePageState();
}

class _ModulePageState extends State<ModulePage> {
  String selectedCategory = "All";

  @override
  Widget build(BuildContext context) {
    List<DataModule> filteredModules = selectedCategory == "All"
        ? modules
        : modules.where((mod) => mod.category == selectedCategory).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(160),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.red,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(height: 40),
              Icon(Icons.import_contacts, color: Colors.white, size: 60),
              SizedBox(height: 10),
              Text(
                "Modul",
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
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: ["All", "Medis", "Reparasi", "Kejahatan"].map((category) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    decoration: BoxDecoration(
                      color: selectedCategory == category ? Colors.red : Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      category,
                      style: TextStyle(
                        color: selectedCategory == category ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredModules.length,
              itemBuilder: (context, index ) {
                var module = filteredModules[index];
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () { 
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            // Cari modul detail berdasarkan title yang sama
                            var detailModule = modulesDetail.firstWhere(
                              (detail) => detail.title == module.title,
                              orElse: () => DetailmoduleModel(
                                title: module.title,
                                category: module.category,
                                description: "Deskripsi tidak tersedia.",
                                steps: [],
                                image: module.image,
                                videoUrl: "",
                                thumbnail: "",
                              ),
                            );
                            return DetailModuleScreen(module: detailModule);
                          },
                        ),
                      );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              module.image,
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 180,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            module.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            height: 2,
                            color: Colors.red,
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
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
