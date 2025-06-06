import 'package:flutter/material.dart';

class InboxTabBar extends StatelessWidget {
  const InboxTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      tabs: [
        Tab(text: 'All'),
        Tab(text: 'Hospitals'),
        Tab(text: 'Clinics'),
        Tab(text: 'Labs'),
      ],
    );
  }
}