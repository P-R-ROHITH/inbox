import 'package:flutter/material.dart';

class InboxAppBar extends StatelessWidget implements PreferredSizeWidget {
  const InboxAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, size: 24),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: const Text(
        'Inbox',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}