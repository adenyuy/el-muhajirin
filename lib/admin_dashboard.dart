import 'package:flutter/material.dart';
import 'kas_page.dart';
import 'kegiatan_page.dart';
import 'berita_page.dart';

class AdminDashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF41966F),
      appBar: AppBar(
        backgroundColor: Color(0xFF41966F),
        elevation: 0,
        title: Text('Dashboard Admin', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              _buildMenu(context, Icons.people, 'Kegiatan', KegiatanPage()),
              _buildMenu(context, Icons.attach_money, 'Kas', KasPage()),
              _buildMenu(context, Icons.article, 'Berita', BeritaPage()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenu(BuildContext context, IconData icon, String title, Widget page) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context, MaterialPageRoute(builder: (_) => page)),
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.black, size: 32),
            SizedBox(width: 16),
            Text(title, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
