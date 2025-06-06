import 'package:flutter/material.dart';

class AttachmentItem extends StatelessWidget {
  final String attachmentUrl;

  AttachmentItem({required this.attachmentUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          attachmentUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}