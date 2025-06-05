import 'package:flutter/material.dart';
import 'package:helpme_slicing_task2/pages/page_detailchat.dart';
import 'package:helpme_slicing_task2/widgets/appBar_module_obrolan.dart';
import 'package:helpme_slicing_task2/widgets/navbar.dart';

class PageObrolan extends StatelessWidget {
  const PageObrolan({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> chatList = [
      {"name": "Rumah Sakit Premier"},
      {"name": "Bengkel Urip Rungkut"},
      {"name": "Servis Ban Sejahtera"},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(160),
        child: const CustomAppBar(icon: Icons.chat, title: "Obrolan"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        child: ListView.builder(
          itemCount: chatList.length,
          itemBuilder: (context, index) {
            return ChatItem(name: chatList[index]["name"]!);
          },
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(), 
      floatingActionButton:
          const CustomFloatingActionButton(), 
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class ChatItem extends StatelessWidget {
  final String name;

  const ChatItem({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
          title: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: const Icon(Icons.chat_bubble_outline, color: Colors.white),
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const PageDetailChat()),
              (route) => false,
            );
          },
        ),
      ),
    );
  }
}
