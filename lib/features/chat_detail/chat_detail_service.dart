import 'chat_detail_model.dart';

class ChatDetailService {
  static List<MessageModel> getMessages() {
    return [
      MessageModel(
        sender: "Dr. Keerthiraj",
        message: "Here is your new prescription.",
        timestamp: DateTime.now().subtract(Duration(minutes: 5)),
        isUser: false,
      ),
      MessageModel(
        sender: "Dr. Keerthiraj",
        message: "https://yourapp.com/attachment/image.jpg",
        timestamp: DateTime.now().subtract(Duration(minutes: 2)),
        isUser: false,
        isAttachment: true,
      ),
      // Additional messages can be defined here.
    ];
  }
}