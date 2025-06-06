import 'package:flutter/material.dart';
import 'chat_item.dart';
import 'chat_service.dart';
import 'chat_model.dart'; // Add this line
import 'special_message_model.dart';
import 'message_templates.dart';

class ChatList extends StatefulWidget {
  final String category;
  const ChatList({super.key, required this.category});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  late List<ChatModel> chats;

  @override
  void initState() {
    super.initState();
    chats = ChatService.getChatsSorted()
        .where((chat) => widget.category == 'All' || chat.category == widget.category)
        .toList();
  }

  void markAsRead(int index) {
    setState(() {
      chats[index] = chats[index].copyWith(unread: false, unreadCount: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Show all chat items
        ...List.generate(
          chats.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ChatItem(
              facilityName: chats[index].facilityName,
              senderName: chats[index].senderName,
              messagePreview: chats[index].lastMessage,
              date: chats[index].date,
              time: chats[index].time,
              unread: chats[index].unread,
              unreadCount: chats[index].unreadCount,
              profilePicture: chats[index].profilePicture,
              onOpen: () => markAsRead(index),
            ),
          ),
        ),
      ],
    );
  }
}