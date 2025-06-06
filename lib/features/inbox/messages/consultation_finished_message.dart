import 'package:flutter/material.dart';
import 'package:inbox/features/chat_detail/chat_bubble.dart';
import 'package:inbox/features/inbox/messages/consultation_chat_message.dart';

class ConsultationConfirmationMessage extends StatelessWidget {
  final String doctorName;
  final String profilePicture;
  final String message;
  final VoidCallback onViewOp;

  const ConsultationConfirmationMessage({
    super.key,
    required this.doctorName,
    required this.profilePicture,
    required this.message,
    required this.onViewOp,
  });

  @override
  Widget build(BuildContext context) {
    return ConsultationChatMessage(
      doctorName: doctorName,
      profilePicture: profilePicture,
      message: message,
      buttonText: "View OP",
      onButtonPressed: onViewOp,
    );
  }
}

class ConsultationFinishedMessage extends StatelessWidget {
  final String doctorName;
  final String profilePicture;
  final String message;
  final VoidCallback onViewPrescription;

  const ConsultationFinishedMessage({
    super.key,
    required this.doctorName,
    required this.profilePicture,
    required this.message,
    required this.onViewPrescription,
  });

  @override
  Widget build(BuildContext context) {
    return ConsultationChatMessage(
      doctorName: doctorName,
      profilePicture: profilePicture,
      message: message,
      buttonText: "View now",
      onButtonPressed: onViewPrescription,
    );
  }
}