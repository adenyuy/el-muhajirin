import 'package:flutter/material.dart';

class KasPage extends StatelessWidget {
  final List<Map<String, dynamic>> kasData = [
    {"jumlah": -20000, "keterangan": "Laundry", "tanggal": "2025-03-27"},
    {"jumlah": 50000, "keterangan": "Donatur", "tanggal": "2025-03-24"},
    {"jumlah": -75000, "keterangan": "Beli Al-Qur'an", "tanggal": "2025-03-27"},
    {"jumlah": 300000, "keterangan": "Donatur atas nama Syukron", "tanggal": "2025-03-20"},
    {"jumlah": -20000, "keterangan": "Laundry Sajadah", "tanggal": "2025-03-27"},
  ];

  @override
  Widget build(BuildContext context) {
    num saldo = kasData.fold(0, (total, item) => total + item['jumlah']);

    return Scaffold(
      appBar: AppBar(title: Text("Kas")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Saldo", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("Rp. ${saldo.toStringAsFixed(0)}", style: TextStyle(fontSize: 24)),
            SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: kasData.length,
                itemBuilder: (context, index) {
                  var item = kasData[index];
                  bool isPemasukan = item['jumlah'] > 0;
                  return Card(
                    child: ListTile(
                      leading: Icon(
                        isPemasukan ? Icons.arrow_upward : Icons.arrow_downward,
                        color: isPemasukan ? Colors.green : Colors.red,
                      ),
                      title: Text("${item['jumlah']} - ${item['keterangan']}"),
                      subtitle: Text(item['tanggal']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
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
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: tambah data baru
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF41966F),
      ),
    );
  }
}
