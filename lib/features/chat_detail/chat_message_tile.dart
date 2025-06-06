import 'package:flutter/material.dart';
import 'chat_bubble.dart';

class ChatMessageTile extends StatelessWidget {
  final String senderName;
  final String profilePicture;
  final String message;
  final Color bubbleColor;
  final TextStyle? textStyle;

  const ChatMessageTile({
    super.key,
    required this.senderName,
    required this.profilePicture,
    required this.message,
    this.bubbleColor = const Color(0xFFFFFFFF),
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final double maxWidth = MediaQuery.of(context).size.width * 0.8; // 80% of screen

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: maxWidth,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile picture
            Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  profilePicture,
                  width: 36,
                  height: 36,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Name and bubble
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    senderName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.blueGrey,
                    ),
                  ),
                  const SizedBox(height: 2),
                  ChatBubble(
                    message: message,
                    color: bubbleColor,
                    textStyle: textStyle,
                  ),
                ],
              ),
            ),
            // Call icon
            SizedBox(
              width: 14,
              height: 14,
              child: Icon(
                Icons.call,
                size: 10,
                color: const Color.fromARGB(255, 135, 151, 135),
              ),
            ),
          ],
        ),
      ),
    );
  }
}