import 'package:flutter/material.dart';
import 'package:helpme_slicing_task2/models/datamodule_model.dart';
import 'package:helpme_slicing_task2/pages/page_detailmodule.dart';
import 'package:helpme_slicing_task2/models/detailmodule_model.dart';
import 'package:helpme_slicing_task2/widgets/navbar.dart';
import 'package:helpme_slicing_task2/widgets/appBar_module_obrolan.dart';


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
        child: CustomAppBar(
          icon: Icons.menu_book,
          title: "Modul",
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomNavBar(),
      floatingActionButton: const CustomFloatingActionButton(),
    );
  }
}