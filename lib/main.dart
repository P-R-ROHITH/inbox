import 'package:flutter/material.dart';
import 'features/inbox/inbox_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'One Way Chat App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: InboxScreen(),
    );
  }
}