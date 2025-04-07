import 'package:flutter/material.dart';
import 'dart:math';

class JadwalTakjilPage extends StatefulWidget {
  const JadwalTakjilPage({super.key});

  @override
  State<JadwalTakjilPage> createState() => _JadwalTakjilPageState();
}

class _JadwalTakjilPageState extends State<JadwalTakjilPage> {
  int selectedDate = 26;
  final List<int> tanggal = [23, 24, 25, 26, 27, 28, 29];

  final List<String> namaRandom = [
    "Fulan bin Fulan",
    "Ahmad bin Salim",
    "Nurul Aisyah",
    "H. Ridwan",
    "Ibu Fatimah",
    "Muhammad Zaki",
    "Siti Mariam",
  ];

  String getRandomNama() {
    final random = Random();
    return namaRandom[random.nextInt(namaRandom.length)];
  }

  String getRandomRumah() {
    final random = Random();
    return "${30 + random.nextInt(10)}${String.fromCharCode(65 + random.nextInt(3))}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9C4DCC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button + title
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      "Jadwal Pemberi\nTakjil Ramadhan\nMasjid Al-Muhajirin",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Tanggal Selector
              SizedBox(
                height: 45,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: tanggal.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    final isSelected = tanggal[index] == selectedDate;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDate = tanggal[index];
                        });
                      },
                      child: Container(
                        width: 45,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.white : Colors.white24,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          tanggal[index].toString(),
                          style: TextStyle(
                            color: isSelected
                                ? const Color(0xFF9C4DCC)
                                : Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              // List Takjil
              Expanded(
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Text(
                            getRandomNama(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            getRandomRumah(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Icon(Icons.nightlight_round,
                              color: Color(0xFF9C4DCC)),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
