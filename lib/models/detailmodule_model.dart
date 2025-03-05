import 'package:flutter/material.dart';

class DetailmoduleModel {
  final String title;
  final String category;
  final String description;
  final List<String> steps;
  final String image;
  final String videoUrl;
  final String thumbnail;

  DetailmoduleModel(
    {
      required this.title, 
      required this.category,
      required this.description,
      required this.steps, 
      required this.image,
      required this.videoUrl,      
      required this.thumbnail,
           
      }
  );
}

  final List<DetailmoduleModel> modulesDetail= [
    DetailmoduleModel(
      title: "Pertolongan Pertama: Pingsan",
      category: "Medis",
      description: "Pingsan dapat dialami oleh siapapun dan kapan saja. Kebanyakan orang pasti panik jika tiba-tiba menemukan orang yang pingsan di dekat kita. Penyebab kepanikan kita sebenarnya karena kita tidak tahu atau kebingungan apa yang harus kita lakukan bila menemukan orang yang pingsan secara tiba-tiba di dekat kita.",
      steps: ["Cek kondisi pernafasan",
      "Baringkan tubuh pasien",
      "Coba bangunkan",
      "Pantau kerja jantung",
      "Pantau tanda kegawatan",
      ],
      image: "assets/pingsan.png",
      videoUrl: "https://www.youtube.com/watch?v=wMiXQeV84AY&ab_channel=KOMPASTV",
      thumbnail: "assets/pingsan.png",
    ),
    DetailmoduleModel(
      title: "Pertolongan Pertama: Kejang",
      category: "Medis",
      description: "Pingsan dapat dialami oleh siapapun dan kapan saja. Kebanyakan orang pasti panik jika tiba-tiba menemukan orang yang pingsan di dekat kita. Penyebab kepanikan kita sebenarnya karena kita tidak tahu atau kebingungan apa yang harus kita lakukan bila menemukan orang yang pingsan secara tiba-tiba di dekat kita.",
      steps: ["Cek kondisi pernafasan",
      "Baringkan tubuh pasien",
      "Coba bangunkan",
      "Pantau kerja jantung",
      "Pantau tanda kegawatan",
      ],
      image: "assets/kejang.png",
      videoUrl: "https://www.youtube.com/watch?v=wMiXQeV84AY&ab_channel=KOMPASTV",
      thumbnail: "assets/kejang.png",

    ),
    DetailmoduleModel(
      title: "Cara Memperbaiki Ban Bocor",
      category: "Reparasi",
      description: "Pingsan dapat dialami oleh siapapun dan kapan saja. Kebanyakan orang pasti panik jika tiba-tiba menemukan orang yang pingsan di dekat kita. Penyebab kepanikan kita sebenarnya karena kita tidak tahu atau kebingungan apa yang harus kita lakukan bila menemukan orang yang pingsan secara tiba-tiba di dekat kita.",
      steps: ["Deteksi Titik Bocor",  
      "Gunakan Cairan Sealant",
      "Gunakan Alat Tambal Ban Tubeless",
      "Pergi ke Bengkel",
      "Rotasi Ban Secara Berkala",
      ],
      image: "assets/ban_bocor.png",
      videoUrl: "https://www.youtube.com/watch?v=HpqcbUg10Ns&ab_channel=2021idechannel",
      thumbnail: "assets/ban_bocor.png",

    ),
    DetailmoduleModel(
      title: "Pencurian HP",
      category: "Kejahatan",
      description: "Pingsan dapat dialami oleh siapapun dan kapan saja. Kebanyakan orang pasti panik jika tiba-tiba menemukan orang yang pingsan di dekat kita. Penyebab kepanikan kita sebenarnya karena kita tidak tahu atau kebingungan apa yang harus kita lakukan bila menemukan orang yang pingsan secara tiba-tiba di dekat kita.",
      steps: ["Cek kondisi HP",
      "Baringkan HP",
      "Coba HP",
      "Pantau kerja HP",
      "Pantau tanda HP",
      ],
      image: "assets/pencurian_hp.jpg",
      videoUrl: "https://www.youtube.com/watch?v=HpqcbUg10Ns&ab_channel=2021idechannel",
      thumbnail: "assets/pencurian_hp.",
    ),
  ];