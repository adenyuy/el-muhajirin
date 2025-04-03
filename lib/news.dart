import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  final String title;

  NewsPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          'Details for $title',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}