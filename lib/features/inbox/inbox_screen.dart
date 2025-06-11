import 'package:flutter/material.dart';
import 'chat_list.dart';
import 'inbox_app_bar.dart';
import 'inbox_tab_bar.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  bool isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = '';

  void _toggleSearch() {
    setState(() {
      isSearching = !isSearching;
      if (!isSearching) {
        searchQuery = '';
        _searchController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Make Scaffold background white
      appBar: AppBar(
        backgroundColor: Colors.white, // AppBar background white
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Search chats...',
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              )
            : const Text(
                'Inbox',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
              ),
        actions: [
          isSearching
              ? IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: _toggleSearch,
                )
              : IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _toggleSearch,
                ),
        ],
      ),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            const InboxTabBar(),
            Expanded(
              child: TabBarView(
                children: [
                  ChatList(category: 'All', searchQuery: searchQuery),
                  ChatList(category: 'Hospital', searchQuery: searchQuery),
                  ChatList(category: 'Clinic', searchQuery: searchQuery),
                  ChatList(category: 'Lab', searchQuery: searchQuery),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}