import 'package:flutter/material.dart';
import 'chat_item.dart';
import 'chat_service.dart';
import 'chat_model.dart'; // Add this line
import 'special_message_model.dart';
import 'message_templates.dart';

class ChatList extends StatefulWidget {
  final String category;
  final String searchQuery; // Add this line

  const ChatList({super.key, required this.category, this.searchQuery = ''});

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
    // Filter chats by search query
    final filteredChats = widget.searchQuery.isEmpty
        ? chats
        : chats.where((chat) =>
            chat.facilityName.toLowerCase().contains(widget.searchQuery.toLowerCase()) ||
            chat.senderName.toLowerCase().contains(widget.searchQuery.toLowerCase()) ||
            chat.lastMessage.toLowerCase().contains(widget.searchQuery.toLowerCase())
          ).toList();

    return ListView(
      children: [
        // Show all chat items
        ...List.generate(
          filteredChats.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ChatItem(
              facilityName: filteredChats[index].facilityName,
              senderName: filteredChats[index].senderName,
              messagePreview: filteredChats[index].lastMessage,
              date: filteredChats[index].date,
              time: filteredChats[index].time,
              unread: filteredChats[index].unread,
              unreadCount: filteredChats[index].unreadCount,
              profilePicture: filteredChats[index].profilePicture,
              onOpen: () => markAsRead(index),
            ),
          ),
        ),
      ],
    );
  }
}