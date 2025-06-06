class ChatModel {
  final String facilityName;
  final String senderName;
  final String lastMessage;
  final String date;
  final String time;
  final String category;
  final String profilePicture;
  bool unread;         // Remove 'final'
  int unreadCount;     // Remove 'final'

  ChatModel({
    required this.facilityName,
    required this.senderName,
    required this.lastMessage,
    required this.date,
    required this.time,
    required this.category,
    required this.profilePicture,
    this.unreadCount = 0, // Initialize with default value
    this.unread = false,
  });

  ChatModel copyWith({
    String? facilityName,
    String? senderName,
    String? lastMessage,
    String? date,
    String? time,
    String? category,
    bool? unread,
    int? unreadCount,
    String? profilePicture,
  }) {
    return ChatModel(
      facilityName: facilityName ?? this.facilityName,
      senderName: senderName ?? this.senderName,
      lastMessage: lastMessage ?? this.lastMessage,
      date: date ?? this.date,
      time: time ?? this.time,
      category: category ?? this.category,
      unread: unread ?? this.unread,
      unreadCount: unreadCount ?? this.unreadCount,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }
}