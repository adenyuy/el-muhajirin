import 'package:flutter/material.dart';

class DkmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF41966F),
      appBar: AppBar(
        backgroundColor: Color(0xFF41966F),
        elevation: 0,
        title: Text('DKM Masjid', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: 5, // contoh data dummy
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            margin: EdgeInsets.only(bottom: 16),
            child: ListTile(
              leading: Icon(Icons.person, size: 40, color: Color(0xFF41966F)),
              title: Text('Fulan bin Fulan'),
              subtitle: Text('Jabatan'),
            ),
          );
        },
      ),
    );
  }
}
