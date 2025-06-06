class MessageModel {
  final String sender;
  final String message;
  final DateTime timestamp;
  final bool isUser;
  final bool isAttachment;

  MessageModel({
    required this.sender,
    required this.message,
    required this.timestamp,
    required this.isUser,
    this.isAttachment = false,
  });
}