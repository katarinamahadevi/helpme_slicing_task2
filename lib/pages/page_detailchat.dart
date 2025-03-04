import 'package:flutter/material.dart';
import 'package:helpme_slicing_task2/pages/page_obrolan.dart';
import 'package:helpme_slicing_task2/widgets/appBar_detailchat.dart';

class PageDetailChat extends StatelessWidget {
  const PageDetailChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(160),
        child: CustomAppBarDetailChat(
        icon: Icons.chat,
        title: "Rumah Sakit Premier",
        height: 250,
      ),           
                ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                ChatBubble(text: "Lokasi dimana ya ?", isSender: true, time: "20.11"),
                ChatBubble(text: "Didekat perempatan merr", isSender: false, time: "20.11"),
                ChatBubble(text: "Saya kirim lokasi nya", isSender: true, time: "20.11"),
                ChatBubble(text: "Baik.", isSender: true, time: "20.12"),
              ],
            ),
          ),
          ChatInputField(),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSender;
  final String time;

  const ChatBubble({super.key, required this.text, required this.isSender, required this.time});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 5),
            Text(
              time,
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}


class ChatInputField extends StatelessWidget {
  const ChatInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.red,
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.location_on, color: Colors.white, size: 30),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.image, color: Colors.white, size: 30),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Tulis pesan...",
                hintStyle: const TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.white.withOpacity(0.3),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.white, size: 30),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
