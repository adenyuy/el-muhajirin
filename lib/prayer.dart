import 'package:flutter/material.dart';

class PrayerPage extends StatefulWidget {
  @override
  _PrayerPageState createState() => _PrayerPageState();
}

class _PrayerPageState extends State<PrayerPage> {
  String selectedDate = "23 Maret, 2025";
  List<Widget> prayerTimes = [];

  final List<Map<String, String>> prayerData = [
    {"name": "Imsak", "time": "04.32", "icon": "assets/images/imsak-fajr-icon.png"},
    {"name": "Fajr", "time": "04.42", "icon": "assets/images/imsak-fajr-icon.png"},
    {"name": "Duhr", "time": "12.03", "icon": "assets/images/duhr-asr-icon.png"},
    {"name": "Asr", "time": "15.14", "icon": "assets/images/duhr-asr-icon.png"},
    {"name": "Maghrib", "time": "18.05", "icon": "assets/images/maghrib-icon.png"},
    {"name": "Isha’a", "time": "19.14", "icon": "assets/images/ishaa-icon.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            SizedBox(height: 20),
            _buildPrayerTimes(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/mosque-background-1.png"), fit: BoxFit.cover),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(selectedDate, style: TextStyle(fontSize: 18, color: Colors.white)),
            Text("Minggu ke-13 (23-29 Maret)", style: TextStyle(fontSize: 14, color: Colors.white)),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(7, (index) {
                String day = ["MIN", "SEN", "SEL", "RAB", "KAM", "JUM", "SAB"][index];
                String date = (23 + index).toString();
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDate = "$date Maret, 2025";
                      prayerTimes = _getPrayerTimesForDate();
                    });
                  },
                  child: Column(
                    children: [
                      Text(day, style: TextStyle(color: Colors.white)),
                      Text(date, style: TextStyle(color: Colors.white)),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getPrayerTimesForDate() {
    return prayerData.map((prayer) => _buildPrayerCard(prayer["icon"]!, prayer["name"]!, prayer["time"]!)).toList();
  }

  Widget _buildPrayerTimes() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: prayerTimes.isNotEmpty
            ? prayerTimes
            : [Text("Silakan pilih tanggal untuk melihat waktu sholat.", style: TextStyle(fontSize: 16))],
      ),
    );
  }

  Widget _buildPrayerCard(String iconPath, String prayerName, String prayerTime) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.asset(iconPath, width: 40, height: 40),
        title: Text(prayerName),
        trailing: Text(prayerTime),
      ),
    );
  }
}