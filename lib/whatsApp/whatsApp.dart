import 'package:flutter/material.dart';

import 'MassageBubble.dart';

class WhatsAppChatScreen extends StatelessWidget {
  const WhatsAppChatScreen({super.key});
  static const String routName = "WhatsAppChatScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181818),
      appBar: AppBar(
        backgroundColor: const Color(0xFF075E54),
        titleSpacing: 0,
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://i.pravatar.cc/150?img=3',
              ),
            ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "John Safwat",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "online",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        actions: const [
          Icon(Icons.videocam),
          SizedBox(width: 15),
          Icon(Icons.call),
          SizedBox(width: 15),
          Icon(Icons.more_vert),
          SizedBox(width: 10),
        ],
      ),


      body: Column(
        children: [

          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: const [
                MessageBubble(
                  text: "Hello 👋",
                  isMe: false,
                ),
                MessageBubble(
                  text: "Hi! How are you?",
                  isMe: true,
                ),
                MessageBubble(
                  text: "I'm good, what about you?",
                  isMe: false,
                ),
                MessageBubble(
                  text: "تمام الحمدلله 😄",
                  isMe: true,
                ),
              ],
            ),
          ),


          const ChatInputField(),
        ],
      ),
    );
  }
}

