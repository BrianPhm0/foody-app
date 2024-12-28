import 'package:flutter/material.dart';
import 'package:foody/core/utils/text_custom.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const TextCustom(text: 'Search', fontSize: 25)),
      body: const Center(
        child: Text('Search Screen'),
      ),
    );
  }
}
