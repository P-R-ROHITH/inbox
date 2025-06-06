import 'chat_model.dart';

class ChatService {
  static final List<ChatModel> _chats = [
    // Hospitals
    ChatModel(
      facilityName: 'Al Arif Hospital',
      senderName: 'Dr. Keerthiraj',
      lastMessage: 'New Prescription has been sent...',
      date: 'Today',
      time: '2:00 PM',
      category: 'Hospital',
      unread: true,
      profilePicture: 'assets/images/hospital1.png',
    ),
    ChatModel(
      facilityName: 'City Hospital',
      senderName: 'Dr. Rajeev Nair',
      lastMessage: 'Your test reports are ready.',
      date: 'Yesterday',
      time: '5:30 PM',
      category: 'Hospital',
      profilePicture: 'assets/images/hospital1.png',
    ),
    ChatModel(
      facilityName: 'Sunrise Medical Center',
      senderName: 'Dr. Priya Kumar',
      lastMessage: 'Appointment confirmed for 10 AM.',
      date: 'Today',
      time: '10:00 AM',
      category: 'Hospital',
      unread: true,
      profilePicture: 'assets/images/hospital1.png',
    ),
    ChatModel(
      facilityName: 'Old Hospital',
      senderName: 'Dr. Old',
      lastMessage: 'This is an old message.',
      date: '2024-05-28', // Use actual date string
      time: '10:00 AM',
      category: 'Hospital',
      unread: false,
      profilePicture: 'assets/images/hospital1.png',
    ),

    // Clinics
    ChatModel(
      facilityName: 'City Clinic',
      senderName: 'Dr. Ananya',
      lastMessage: 'Test results uploaded.',
      date: 'Yesterday',
      time: '4:45 PM',
      category: 'Clinic',
      profilePicture: 'assets/images/hospital1.png',
    ),
    ChatModel(
      facilityName: 'Healthy Family Clinic',
      senderName: 'Dr. Manish Gupta',
      lastMessage: 'Routine check-up report ready.',
      date: '2024-05-28', // <-- Use actual date string
      time: '3:15 PM',
      category: 'Clinic',
      profilePicture: 'assets/images/hospital1.png',
    ),

    // Labs
    ChatModel(
      facilityName: 'MedLab Diagnostics',
      senderName: 'Lab Assistant',
      lastMessage: 'Your blood test results are available.',
      date: '2024-05-28', // <-- Use actual date string
      time: '10:30 AM',
      category: 'Lab',
      profilePicture: 'assets/images/hospital1.png',
    ),
    ChatModel(
      facilityName: 'Precision Labs',
      senderName: 'Lab Technician',
      lastMessage: 'Your radiology scans are uploaded.',
      date: 'Yesterday',
      time: '11:00 AM',
      category: 'Lab',
      profilePicture: 'assets/images/hospital1.png',
    ),
    ChatModel(
      facilityName: 'Care Diagnostics',
      senderName: 'Lab Coordinator',
      lastMessage: 'Your full-body checkup results are ready.',
      date: 'Today',
      time: '11:00 AM',
      category: 'Lab',
      unread: true, // Mark as unread
      unreadCount: 2, // Or any number you want
      profilePicture: 'assets/images/hospital1.png',
    ),
  ];

  static List<ChatModel> getChats() => _chats;

  static void markAsRead(String facilityName, String senderName) {
    for (var chat in _chats) {
      if (chat.facilityName == facilityName && chat.senderName == senderName) {
        chat.unread = false;
        chat.unreadCount = 0;
      }
    }
  }

  static List<ChatModel> getChatsSorted() {
    List<ChatModel> chats = List.from(_chats);

    DateTime parseDateTime(ChatModel chat) {
      // Handle "Today" and "Yesterday"
      DateTime now = DateTime.now();
      String dateStr = chat.date;
      if (dateStr == "Today") {
        dateStr = "${now.day.toString().padLeft(2, '0')}-${now.month.toString().padLeft(2, '0')}-${now.year}";
      } else if (dateStr == "Yesterday") {
        final yesterday = now.subtract(const Duration(days: 1));
        dateStr = "${yesterday.day.toString().padLeft(2, '0')}-${yesterday.month.toString().padLeft(2, '0')}-${yesterday.year}";
      }
      // Parse date (dd-MM-yyyy or yyyy-MM-dd)
      List<String> parts = dateStr.split('-');
      DateTime date;
      if (parts[0].length == 4) {
        // yyyy-MM-dd
        date = DateTime.parse(dateStr);
      } else {
        // dd-MM-yyyy
        date = DateTime(
          int.parse(parts[2]),
          int.parse(parts[1]),
          int.parse(parts[0]),
        );
      }
      // Parse time (e.g., '10:00 AM')
      final timeParts = chat.time.split(' ');
      final hm = timeParts[0].split(':');
      int hour = int.parse(hm[0]);
      int minute = int.parse(hm[1]);
      if (timeParts.length > 1 && timeParts[1].toUpperCase() == 'PM' && hour != 12) hour += 12;
      if (timeParts.length > 1 && timeParts[1].toUpperCase() == 'AM' && hour == 12) hour = 0;
      return DateTime(date.year, date.month, date.day, hour, minute);
    }

    chats.sort((a, b) => parseDateTime(b).compareTo(parseDateTime(a)));
    return chats;
  }
}