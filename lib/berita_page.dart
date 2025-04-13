import 'package:flutter/material.dart';

class BeritaPage extends StatelessWidget {
  final List<Map<String, String>> berita = [
    {
      "gambar": "assets/images/gambar-berita.jpg",
      "judul": "Kegiatan Buka Puasa Bersama Hari Senin 23 Maret 2025"
    },
    {
      "gambar": "assets/images/berita-2.png",
      "judul": "Tidak mempunyai cash? Sekarang bisa donasi melalui QRIS"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Berita Kegiatan")),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: berita.length,
        itemBuilder: (context, index) {
          final item = berita[index];
          return Card(
            child: Column(
              children: [
                Image.asset(item['gambar'] ?? '', fit: BoxFit.cover),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(item['judul'] ?? '',
                      style: TextStyle(fontSize: 16)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: () {}, child: Text("Edit")),
                    TextButton(
                        onPressed: () {},
                        child: Text("Hapus", style: TextStyle(color: Colors.red))),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
