import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:helpme_slicing_task2/models/detailmodule_model.dart';

class DetailModuleScreen extends StatelessWidget {
  final DetailmoduleModel module;

  const DetailModuleScreen({Key? key, required this.module}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stack untuk gambar utama + tombol back
            Stack(
              children: [
                // Gambar utama sebagai header penuh
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  child: Image.asset(
                    module.image,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.35,
                    fit: BoxFit.cover,
                  ),
                ),
                // Tombol Back
                Positioned(
                  top: 40,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Judul dengan background merah
                  Container(
                    padding: EdgeInsets.fromLTRB(40,10,40,10), //mengatur container judul
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      module.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0), // Mengatur padding kanan dan kiri
                  child: Text(
                    module.description,
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.justify,
                  ),
                ),
                  SizedBox(height: 16),
                  Text(
                    "Langkah Pertolongan Pertama untuk Membantu Orang yang Pingsan",
                    style: TextStyle(fontWeight: FontWeight.bold), 

                  ),
                  SizedBox(height: 10),

                  // Menggunakan Wrap untuk membuat dua kolom langkah-langkah
                  Wrap(
                    spacing: 16, // Jarak antara item dalam baris
                    runSpacing: 8, // Jarak antar baris
                    children: List.generate(
                      module.steps.length,
                      (index) => SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45, // Lebar tiap langkah
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 14, // Ukuran lingkaran
                              child: Text(
                                "${index + 1}",
                                style: TextStyle(color: Colors.white, fontSize: 14),
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                module.steps[index],
                                style: TextStyle(fontSize: 14),
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 16),
                  Text(
                    "Simak video berikut",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0), // Atur padding kanan dan kiri
                  child: InkWell(
                    onTap: () async {
                      final url = module.videoUrl;
                      if (await canLaunch(url)) {
                        await launch(url);
                      }
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            module.thumbnail, // Menggunakan thumbnail sesuai modul
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Icon(
                          Icons.play_circle_fill,
                          color: Colors.white,
                          size: 50,
                        ),
                      ],
                    ),
                  ),
                ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
