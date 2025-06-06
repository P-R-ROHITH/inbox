import 'dart:math';
import 'package:flutter/material.dart';
import '../chat_detail/chat_detail_screen.dart';
import 'chat_service.dart'; // <-- Import the ChatService

class ChatItem extends StatelessWidget {
  final String facilityName;
  final String senderName;
  final String messagePreview;
  final String date; // e.g., 'Today', 'Yesterday'
  final String time; // e.g., '2:00 PM'
  final bool? unread;
  final int? unreadCount;
  final String profilePicture;
  final VoidCallback? onOpen;

  const ChatItem({
    super.key,
    required this.facilityName,
    required this.senderName,
    required this.messagePreview,
    required this.date,
    required this.time,
    this.unread,
    this.unreadCount,
    required this.profilePicture,
    this.onOpen,
  });

  @override
  Widget build(BuildContext context) {
    final random = Random(senderName.hashCode);
    final commentBoxColor = Color.fromARGB(
      255,
      180 + random.nextInt(56),
      180 + random.nextInt(56),
      180 + random.nextInt(56),
    );

    return InkWell(
      onTap: () {
        if (onOpen != null) onOpen!();
        ChatService.markAsRead(facilityName, senderName); // <-- Add this
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChatDetailScreen(
              facilityName: facilityName,
              messageContent: messagePreview,
              date: date,
            ),
          ),
        );
      },
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  profilePicture,
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      facilityName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: commentBoxColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            senderName,
                            style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            messagePreview,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: unread == true ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12, top: 8, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 6),
                  Text(
                    date,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  // Unread indicator between date and time
                  if (unread == true)
                    unreadCount != null && unreadCount! > 1
                        ? Container(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            width: 22,
                            height: 22,
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              unreadCount.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          )
                        : Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                          ),
                  Spacer(), // This pushes the time to the bottom
                  Text(
                    time,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
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