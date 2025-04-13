import 'package:flutter/material.dart';

class KegiatanPage extends StatelessWidget {
  final List<Map<String, String>> bookings = [
    {
      "status": "Diterima",
      "nama": "Virgio",
      "telepon": "08120486725",
      "mulai": "2025-03-26 18:00:00",
      "akhir": "2025-03-26 20:00:00",
      "tujuan": "Pesantren Kilat"
    },
    {
      "status": "Ditolak",
      "nama": "Marvin",
      "telepon": "081210488675",
      "mulai": "2025-03-25 19:00:00",
      "akhir": "2025-03-25 21:00:00",
      "tujuan": "Acara RT/RW"
    },
    {
      "status": "Pending",
      "nama": "Melvin",
      "telepon": "081213827646",
      "mulai": "2025-03-24 15:00:00",
      "akhir": "2025-03-24 18:00:00",
      "tujuan": "Santunan anak yatim/piatu"
    },
  ];

  Color getStatusColor(String status) {
    switch (status) {
      case "Diterima":
        return Colors.green;
      case "Ditolak":
        return Colors.red;
      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Data Booking")),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          final item = bookings[index];
          return Card(
            margin: EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Chip(
                        label: Text(item["status"] ?? ""),
                        backgroundColor: getStatusColor(item["status"] ?? ""),
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {
                          // TODO: edit data
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          // TODO: hapus data
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text("Nama: ${item['nama']}"),
                  Text("Nomor Telepon: ${item['telepon']}"),
                  Text("Mulai Booking: ${item['mulai']}"),
                  Text("Akhir Booking: ${item['akhir']}"),
                  Text("Tujuan Acara: ${item['tujuan']}"),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Tambah data baru
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF41966F),
      ),
    );
  }
}
