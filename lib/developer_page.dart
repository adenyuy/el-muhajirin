import 'package:flutter/material.dart';

class DeveloperPage extends StatelessWidget {
  final List<Map<String, String>> developers = [
    {
      'name': 'Virgio Mahardika Danang Putra',
      'npm': '2307411035',
    },
    {
      'name': 'Marvin Raditya Nugraha',
      'npm': '2307411044',
    },
    {
      'name': 'Melvin Okniel Sinaga',
      'npm': '2307411061',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF41966F),
      appBar: AppBar(
        backgroundColor: Color(0xFF41966F),
        elevation: 0,
        title: Text('Pengembang Aplikasi', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: developers.length,
        itemBuilder: (context, index) {
          final dev = developers[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            margin: EdgeInsets.only(bottom: 16),
            child: ListTile(
              leading: Icon(Icons.person, size: 40, color: Color(0xFF41966F)),
              title: Text('${dev['name']} - ${dev['npm']}'),
              subtitle: Text('TI - 4B'),
            ),
          );
        },
      ),
    );
  }
}
