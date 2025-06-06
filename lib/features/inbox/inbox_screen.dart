import 'package:flutter/material.dart';
import 'chat_list.dart';
import 'inbox_app_bar.dart';
import 'inbox_tab_bar.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const InboxAppBar(),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            const InboxTabBar(),
            Expanded(
              child: TabBarView(
                children: [
                  ChatList(category: 'All'),
                  ChatList(category: 'Hospital'),
                  ChatList(category: 'Clinic'),
                  ChatList(category: 'Lab'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}