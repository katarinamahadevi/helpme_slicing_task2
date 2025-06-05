import 'package:flutter/material.dart';
import 'package:helpme_slicing_task2/models/chat_model.dart';
import 'package:helpme_slicing_task2/widgets/appBar_detailchat.dart';

class PageDetailChat extends StatefulWidget {
  const PageDetailChat({super.key});

  @override
  _PageDetailChatState createState() => _PageDetailChatState();
}

class _PageDetailChatState extends State<PageDetailChat> {
  List<ChatMessage> messages = [];
  final TextEditingController _controller =
      TextEditingController(); 

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  void _loadMessages() async {
    List<ChatMessage> loadedMessages = await ChatMessage.loadMessages();
    setState(() {
      messages = loadedMessages;
    });
  }

  void _sendMessage(String text, bool isSender) {
    if (text.isEmpty) return;

    ChatMessage newMessage = ChatMessage(
      text: text,
      isSender: isSender, 
      time: TimeOfDay.now().format(context),
    );

    setState(() {
      messages.add(newMessage);
    });

    _controller.clear();
    ChatMessage.saveMessages(messages);
  }

  void _deleteMessage(int index) async {
    List<ChatMessage> updatedMessages = await ChatMessage.deleteMessage(
      index,
      messages,
    );
    setState(() {
      messages = updatedMessages;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarDetailChat(
        icon: Icons.chat,
        title: "Rumah Sakit Premier",
        height: 200,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onLongPress:
                      () =>
                          _deleteMessage(index), 
                  child: ChatBubble(
                    text: messages[index].text,
                    isSender: messages[index].isSender,
                    time: messages[index].time,
                  ),
                );
              },
            ),
          ),
          ChatInputField(
            controller: _controller,
            onSend:
                (text, isSender) => _sendMessage(
                  text,
                  isSender,
                ), 
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSender;
  final String time;

  const ChatBubble({
    super.key,
    required this.text,
    required this.isSender,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSender ? Colors.red : Colors.grey[300],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              text,
              style: TextStyle(
                color: isSender ? Colors.white : Colors.black,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              time,
              style: TextStyle(
                color: isSender ? Colors.white70 : Colors.black54,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatInputField extends StatefulWidget {
  final TextEditingController controller;
  final Function(String, bool) onSend; 

  const ChatInputField({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  _ChatInputFieldState createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  bool _isChecked = false; 

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: const BoxDecoration(color: Colors.red),
      child: Row(
        children: [
          Checkbox(
            side: BorderSide(color: Colors.white, style: BorderStyle.solid),
            value: _isChecked,
            onChanged: (bool? value) {
              setState(() {
                _isChecked = value!;
              });
            },
            activeColor: Colors.white,
            checkColor: Colors.red,
          ),
          Expanded(
            child: TextField(
              controller: widget.controller,
              decoration: InputDecoration(
                hintText: "Ketik pesan...",
                hintStyle: const TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.white.withOpacity(0.3),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.white, size: 30),
            onPressed: () => widget.onSend(widget.controller.text, _isChecked),
          ),
        ],
      ),
    );
  }
}
