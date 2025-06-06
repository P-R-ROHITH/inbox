import 'package:flutter/material.dart';
import 'package:inbox/features/inbox/messages/consultation_confirmation_message.dart' as confirmation;
import 'package:inbox/features/inbox/messages/consultation_finished_message.dart' as finished;
import 'package:inbox/features/inbox/messages/follow_up_card.dart' as followup;
import 'package:inbox/features/inbox/chat_preview_tile.dart';
import 'chat_background.dart';
import 'chat_message_tile.dart';
import 'package:inbox/features/inbox/message_templates.dart';
import 'package:inbox/features/inbox/special_message_model.dart';
import 'package:inbox/features/inbox/inbox_app_bar.dart';
import 'package:inbox/features/chat_detail/chat_app_bar.dart';

class ChatDetailScreen extends StatefulWidget {
  final String facilityName;
  final String messageContent;
  final String date;
  final String profilePicture = 'assets/images/hospital1.png';

  ChatDetailScreen({
    required this.facilityName,
    required this.messageContent,
    required this.date,
  });

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  bool isBooking = false;
  bool followUpBooked = false;

  final List<SpecialMessage> specialMessages = [
    SpecialMessage(
      type: SpecialMessageType.appointmentConfirmed,
      doctorName: "Dr. Priya Kumar",
      facility: "Sunrise Medical Center",
      date: "03-06-2025",
      bookingId: "#123456",
    ),
    SpecialMessage(
      type: SpecialMessageType.consultationFinished,
      doctorName: "Dr. Priya Kumar",
      facility: "Sunrise Medical Center",
      date: "03-06-2025",
    ),
    SpecialMessage(
      type: SpecialMessageType.followUp,
      doctorName: "Dr. Priya Kumar",
      facility: "Sunrise Medical Center",
      date: "10-06-2025",
      followUpDate: "10-06-2025",
    ),
  ];

  Widget buildStatCard(SpecialMessage msg) {
    if (msg.type == SpecialMessageType.followUp) {
      return followup.FollowUpCard(
        doctorName: msg.doctorName,
        facility: msg.facility,
        date: msg.followUpDate ?? msg.date,
        note: "Please book a follow-Up to review your progress",
      );
    }
    switch (msg.type) {
      case SpecialMessageType.appointmentConfirmed:
        return confirmation.ConsultationConfirmationMessage(
          doctorName: msg.doctorName,
          profilePicture: "assets/images/doctorprofilepic.png",
          message: "Your appointment is confirmed for 3:00PM.",
          onViewOp: () {
            // Handle view OP ticket
          },
        );
      case SpecialMessageType.consultationFinished:
        return finished.ConsultationFinishedMessage(
          doctorName: msg.doctorName,
          profilePicture: "assets/images/doctorprofilepic.png",
          message: "Hello, your appointment at 3:00PM has been Finished and Prescription has been added.",
          onViewPrescription: () {
            // Handle view prescription
          },
        );
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFF),
      appBar: ChatAppBar(
        facilityName: widget.facilityName,
        profilePicture: widget.profilePicture,
        address: "123 Medical Street, City",
        onCallPressed: () {
          // Handle call action
        },
        // onMenuPressed: () { // Uncomment and use if ChatAppBar has this parameter
        //   // Handle menu action
        // },
      ),
      body: ChatBackground(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  getDisplayDate(widget.date),
                  style: TextStyle(color: Colors.grey[200]),
                ),
              ),
              SizedBox(height: 8),
              Expanded(
                child: ListView(
                  children: [
                    // Stat card messages inside the chat
                    ...specialMessages.map(buildStatCard).toList(),
                    // Your normal chat messages
                    ChatMessageTile(
                      senderName: "Dr. Keerthiraj",
                      profilePicture: "assets/images/doctorprofilepic.png",
                      message: "Hello, how can I help you?",
                      bubbleColor: Colors.white.withOpacity(0.85),
                    ),
                    ChatMessageTile(
                      senderName: "Dr. Rajeev Nair",
                      profilePicture: "assets/images/doctorprofilepic.png",
                      message: "Please upload your reports.",
                      bubbleColor: Colors.white.withOpacity(0.85),
                    ),
                    // Add more messages as needed
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  String getDisplayDate(String dateString) {
    if (dateString == "Today" || dateString == "Yesterday") return dateString;

    try {
      final parsed = DateTime.parse(dateString);
      final now = DateTime.now();
      final yesterday = now.subtract(const Duration(days: 1));

      if (parsed.year == now.year && parsed.month == now.month && parsed.day == now.day) {
        return "Today";
      } else if (parsed.year == yesterday.year && parsed.month == yesterday.month && parsed.day == yesterday.day) {
        return "Yesterday";
      } else {
        // Return as dd-MM-yyyy
        return "${parsed.day.toString().padLeft(2, '0')}-"
               "${parsed.month.toString().padLeft(2, '0')}-"
               "${parsed.year}";
      }
    } catch (e) {
      return dateString;
    }
  }
}
