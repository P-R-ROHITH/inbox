import 'package:flutter/material.dart';
import 'search_box.dart';

class SearchFeature {
  bool isSearching;
  final TextEditingController controller;
  late VoidCallback toggleSearch;
  String searchQuery = '';

  SearchFeature({
    required this.isSearching,
    required this.controller,
    required this.toggleSearch,
  });

  void setToggleSearch(VoidCallback fn) {
    toggleSearch = fn;
  }

  void updateSearchState(bool searching) {
    isSearching = searching;
    if (!searching) {
      searchQuery = ''; // Clear search query when closing search
    }
  }

  Widget buildAppBarTitle(VoidCallback onQueryChanged) {
    if (isSearching) {
      return SearchBox(
        controller: controller,
        onChanged: (value) {
          searchQuery = value;
          onQueryChanged(); // This triggers setState in the parent!
        },
        onClose: toggleSearch,
      );
    } else {
      return const Text(
        'Inbox',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
      );
    }
  }

  Widget buildSearchAction() {
    return IconButton(
      icon: Icon(isSearching ? Icons.close : Icons.search, size: 24),
      onPressed: toggleSearch,
    );
  }
}

class SearchChatsAction extends StatelessWidget {
  final VoidCallback onPressed;

  const SearchChatsAction({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.search, size: 24),
      tooltip: 'Search Chats',
      onPressed: onPressed,
    );
  }
}