import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String facilityName;
  final String profilePicture;
  final String address;
  final String phoneNumber; // Add this

  const ChatAppBar({
    super.key,
    required this.facilityName,
    required this.profilePicture,
    required this.address,
    required this.phoneNumber, // Add this
  });

  Future<void> _launchDialer() async {
    final Uri url = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, size: 24),
        onPressed: () => Navigator.of(context).pop(),
      ),
      titleSpacing: 0,
      title: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(profilePicture),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  facilityName,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  address,
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.call, color: Color(0xFF2563EB), size: 22),
          onPressed: _launchDialer,
        ),
        PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert),
          onSelected: (value) {
            // Handle menu option selection
            if (value == 'settings') {
              // Navigate to settings
            } else if (value == 'help') {
              // Show help
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'settings',
              child: Text('Settings'),
            ),
            const PopupMenuItem(
              value: 'help',
              child: Text('Help'),
            ),
          ],
        ),
      ],
      elevation: 0,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}