import 'package:flutter/material.dart';

class ChatPreviewTile extends StatelessWidget {
  final String doctorName;
  final String profilePicture;
  final List<String> messages;

  const ChatPreviewTile({
    super.key,
    required this.doctorName,
    required this.profilePicture,
    required this.messages,
  });

  @override
  Widget build(BuildContext context) {
    final String lastMessage = messages.isNotEmpty ? messages.last : "";

    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage(profilePicture),
      ),
      title: Text(
        doctorName,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        lastMessage,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: Colors.black54),
      ),
      onTap: () {
        // Navigate to chat detail screen
      },
    );
  }
}