import 'package:flutter/material.dart';
import 'package:inbox/features/chat_detail/chat_bubble.dart';

class ConsultationChatMessage extends StatefulWidget {
  final String doctorName;
  final String profilePicture;
  final String message;
  final String buttonText;
  final VoidCallback onButtonPressed;

  const ConsultationChatMessage({
    super.key,
    required this.doctorName,
    required this.profilePicture,
    required this.message,
    required this.buttonText,
    required this.onButtonPressed,
  });

  @override
  State<ConsultationChatMessage> createState() => _ConsultationChatMessageState();
}

class _ConsultationChatMessageState extends State<ConsultationChatMessage> {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = 0.95;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1.0;
    });
  }

  void _onTapCancel() {
    setState(() {
      _scale = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(widget.profilePicture),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.doctorName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 2),
                ChatBubble(
                  message: widget.message,
                  color: const Color(0xFF7EC8F7),
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 15.5,
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF7B61FF), Color(0xFFE15BBA)],
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextButton(
                      onPressed: widget.onButtonPressed,
                      style: TextButton.styleFrom(
                        minimumSize: const Size(64, 28),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        widget.buttonText,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}