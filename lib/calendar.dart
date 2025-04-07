import 'package:flutter/material.dart';
import 'booking_form.dart'; // Import halaman booking
import 'jadwal_takjil.dart';
import 'zakat_page.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  void _showRamadhanMenu(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(20),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50),
                padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    colors: [
                      Colors.deepPurple.shade400,
                      Colors.purple.shade200
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Spesial Ramadhan",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Jadwal Takzil Button
                    _glassButton(
                      icon: Icons.fastfood,
                      label: "Jadwal Takzil",
                      onTap: () {
                        Navigator.pop(context); // Tutup dialog dulu
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const JadwalTakjilPage()),
                        );
                      },
                    ),

                    const SizedBox(height: 12),

                    // Zakat Button
                    _glassButton(
                      icon: Icons.volunteer_activism,
                      label: "Zakat",
                      onTap: () {
                        Navigator.pop(context); // Tutup dialog dulu
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ZakatPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),

              // Top Icon
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: Icon(Icons.star, color: Colors.deepPurple, size: 50),
              ),

              // Close Button
              Positioned(
                top: 10,
                right: 10,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.close, color: Colors.deepPurple),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _glassButton(
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Kalender Kegiatan
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: [Colors.green, Colors.teal],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Kalender Kegiatan",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_on,
                                  color: Colors.white, size: 18),
                              SizedBox(width: 4),
                              Text("Masjid Al-Muhajirin",
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          Text("Maret 2025",
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Spesial Ramadhan
                GestureDetector(
                  onTap: () => _showRamadhanMenu(context),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(
                        colors: [Colors.purple, Colors.deepPurple],
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.nights_stay, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          "Spesial Ramadhan",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Icon(Icons.more_horiz, color: Colors.white),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // Booking Aula dengan GestureDetector
                Row(
                  children: [
                    const Text(
                      "Ingin menggunakan aula masjid? Booking ",
                      style: TextStyle(fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BookingFormPage()),
                        );
                      },
                      child: const Text(
                        "disini",
                        style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // List Kegiatan
                Column(
                  children: List.generate(4, (index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: const LinearGradient(
                          colors: [Colors.green, Colors.teal],
                        ),
                      ),
                      child: const Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "1 Maret 2025",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Melaksanakan Puasa Pertama",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
