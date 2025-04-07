import 'package:flutter/material.dart';

class ZakatPage extends StatelessWidget {
  const ZakatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: const Text('Informasi Zakat'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionCard(
              icon: Icons.info_outline,
              title: 'Apa itu Zakat?',
              content:
                  'Zakat adalah salah satu rukun Islam yang wajib ditunaikan oleh setiap Muslim yang mampu. Zakat berfungsi membersihkan harta dan membantu mereka yang membutuhkan.',
            ),
            const SizedBox(height: 16),
            _sectionCard(
              icon: Icons.gavel,
              title: 'Hukum Zakat',
              content:
                  'Zakat hukumnya fardhu ain (wajib) bagi setiap Muslim yang telah memenuhi syarat. Meninggalkan zakat termasuk dosa besar dalam Islam.',
            ),
            const SizedBox(height: 16),
            _sectionCard(
              icon: Icons.attach_money,
              title: 'Besaran Zakat Fitrah',
              content:
                  'Besaran zakat fitrah yang harus dikeluarkan adalah setara dengan 2,5 kg atau 3,5 liter beras/makanan pokok per orang, atau sekitar Rp 40.000 - Rp 50.000 tergantung harga beras lokal.',
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  // Aksi jika ingin disambungkan ke fitur kalkulator zakat atau form pembayaran nanti
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Fitur perhitungan zakat coming soon!")),
                  );
                },
                icon: const Icon(Icons.calculate),
                label: const Text("Hitung Zakat Saya"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionCard(
      {required IconData icon,
      required String title,
      required String content}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.deepPurple, size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(
                  content,
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
