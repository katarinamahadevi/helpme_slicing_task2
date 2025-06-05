import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ChatMessage {
  final String text;
  final bool isSender;
  final String time;

  ChatMessage({required this.text, required this.isSender, required this.time});


  Map<String, dynamic> toJson() { 
    return {
      'text': text,
      'isSender': isSender,
      'time': time,
    };
  }


  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      text: json['text'],
      isSender: json['isSender'],
      time: json['time'],
    );
  }

  static Future<void> saveMessages(List<ChatMessage> messages) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> encodedMessages = messages.map((msg) => jsonEncode(msg.toJson())).toList();
    await prefs.setStringList('chat_messages', encodedMessages);
  }

  static Future<List<ChatMessage>> loadMessages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? encodedMessages = prefs.getStringList('chat_messages');

    if (encodedMessages != null) {
      return encodedMessages.map((msg) => ChatMessage.fromJson(jsonDecode(msg))).toList();
    } else {
      return [];
    }
  }

  static Future<List<ChatMessage>> deleteMessage(int index, List<ChatMessage> messages) async {
    messages.removeAt(index);
    await saveMessages(messages);
    return messages;
  }
}
