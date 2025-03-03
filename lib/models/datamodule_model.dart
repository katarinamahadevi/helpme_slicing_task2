
class DataModule {
  final String title;
  final String category;
  final String image;

  DataModule(
    {
      required this.title, 
      required this.category, 
      required this.image,
      }
  );
}
  final List<DataModule> modules = [
    DataModule(
      title: "Pertolongan Pertama: Pingsan",
      category: "Medis",
      image: "assets/pingsan.png",
    ),
    DataModule(
      title: "Pertolongan Pertama: Kejang",
      category: "Medis",
      image: "assets/kejang.png",
    ),
    DataModule(
      title: "Cara Memperbaiki Ban Bocor",
      category: "Reparasi",
      image: "assets/ban_bocor.png",
    ),
    DataModule(
      title: "Perbaikan Mesin Mobil Berasap",
      category: "Reparasi",
      image: "assets/reparation.png",
    ),
    DataModule(
      title: "Pencurian HP",
      category: "Kejahatan",
      image: "assets/pencurian_hp.jpg",
    ),
    DataModule(
      title: "Mengatasi Luka Bakar",
      category: "Medis",
      image: "assets/ambulance.png"
    ),
  ];
  
