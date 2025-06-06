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
                  child: GestureDetector(
                    onTapDown: _onTapDown,
                    onTapUp: (details) {
                      _onTapUp(details);
                      widget.onButtonPressed();
                    },
                    onTapCancel: _onTapCancel,
                    child: AnimatedScale(
                      scale: _scale,
                      duration: const Duration(milliseconds: 100),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          gradient: const LinearGradient(
                            colors: [Color(0xFF7B61FF), Color(0xFFE15BBA)],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          widget.buttonText,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
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