import 'package:flutter/material.dart';

class DkmPage extends StatelessWidget {
  final List<Map<String, String>> pengurus = [
    {
      'nama': 'Ahmad Fauzi',
      'jabatan': 'Ketua Takmir',
    },
    {
      'nama': 'Budi Santoso',
      'jabatan': 'Sekretaris',
    },
    {
      'nama': 'H. Mulyadi',
      'jabatan': 'Bendahara',
    },
    {
      'nama': 'Rizky Ramadhan',
      'jabatan': 'Marbot (Penjaga Kebersihan dan Keamanan)',
    },
    {
      'nama': 'Ust. Syamsul Huda',
      'jabatan': 'Koordinator Kegiatan Keagamaan',
    },
  ];

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
        itemCount: pengurus.length,
        itemBuilder: (context, index) {
          final item = pengurus[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            margin: EdgeInsets.only(bottom: 16),
            child: ListTile(
              leading: Icon(Icons.person, size: 40, color: Color(0xFF41966F)),
              title: Text(item['nama']!),
              subtitle: Text(item['jabatan']!),
            ),
          );
        },
      ),
    );
  }
}
