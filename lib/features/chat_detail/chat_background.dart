import 'package:flutter/material.dart';

class ChatBackground extends StatelessWidget {
  final Widget child;
  const ChatBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF3F4F6), // Subtle grayish white for contrast
      child: child,
    );
  }
}