import 'package:flutter/material.dart';
import 'chat_bubble_clipper.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final Color color;
  final TextStyle? textStyle;

  const ChatBubble({
    super.key,
    required this.message,
    this.color = const Color(0xFFFFFFFF),
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ChatBubbleClipperLeft(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        color: color,
        child: Text(
          message,
          style: textStyle ?? const TextStyle(color: Colors.black87, fontSize: 16),
        ),
      ),
    );
  }
}