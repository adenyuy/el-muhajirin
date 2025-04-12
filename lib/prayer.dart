import 'package:flutter/material.dart';

/// A StatefulWidget that displays a list of prayer times for a selected day.
/// Includes a header with a date selector and prayer cards with detailed info.
class PrayerPage extends StatefulWidget {
  @override
  _PrayerPageState createState() => _PrayerPageState();
}

class _PrayerPageState extends State<PrayerPage> {
  // The currently selected date shown in the header
  String selectedDate = "23 Maret, 2025";

  // List of widgets representing the prayer time cards
  List<Widget> prayerTimes = [];

  // Sample data for prayer times
  final List<Map<String, String>> prayerData = [
    {"name": "Imsak", "time": "04.32", "icon": "assets/images/imsak-fajr-icon.png"},
    {"name": "Fajr", "time": "04.42", "icon": "assets/images/imsak-fajr-icon.png"},
    {"name": "Duhr", "time": "12.03", "icon": "assets/images/duhr-asr-icon.png"},
    {"name": "Asr", "time": "15.14", "icon": "assets/images/duhr-asr-icon.png"},
    {"name": "Maghrib", "time": "18.05", "icon": "assets/images/maghrib-icon.png"},
    {"name": "Isha’a", "time": "19.14", "icon": "assets/images/ishaa-icon.png"},
    {"name": "Tarawih", "time": "19.24", "icon": "assets/images/ishaa-icon.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(), // Builds the top section with date selection
            SizedBox(height: 20),
            _buildPrayerTimes(), // Builds the list of prayer cards
          ],
        ),
      ),
    );
  }

  /// Builds the header section, including a background image,
  /// selected date info, and clickable days for selection.
  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/mosque-background-1.png"),
          fit: BoxFit.cover,
        ),
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
                // Day abbreviations (Sunday to Saturday)
                String day = ["MIN", "SEN", "SEL", "RAB", "KAM", "JUM", "SAB"][index];
                // Corresponding dates for that week
                String date = (23 + index).toString();
                return MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      // When a date is selected, update the selectedDate
                      // and refresh the prayerTimes list
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
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  /// Returns a list of widgets representing prayer times for the selected date.
  /// Each prayer time is converted into a card widget.
  List<Widget> _getPrayerTimesForDate() {
    return prayerData
        .map((prayer) => _buildPrayerCard(prayer["icon"]!, prayer["name"]!, prayer["time"]!))
        .toList();
  }

  /// Builds the section that contains all prayer cards.
  /// If no date is selected yet, shows a default instruction text.
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

  /// Builds a single prayer card widget using ListTile inside a Card.
  /// Clicking the card will open a dialog with more information.
  Widget _buildPrayerCard(String iconPath, String prayerName, String prayerTime) {
    return GestureDetector(
      onTap: () {
        _showPrayerDetailsDialog(iconPath, prayerName, prayerTime);
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          leading: Image.asset(iconPath, width: 40, height: 40),
          title: Text(prayerName),
          trailing: Text(prayerTime),
        ),
      ),
    );
  }

  /// Shows a dialog when a prayer card is tapped.
  /// The dialog contains the prayer name, date, time, and imam's name.
  void _showPrayerDetailsDialog(String iconPath, String prayerName, String prayerTime) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text(prayerName)),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Image.asset(iconPath, width: 40, height: 40),
                SizedBox(height: 10),
                Text("Tanggal: $selectedDate"),
                Text("Waktu: $prayerTime"),
                Text("Imam: Habib Ja'far"),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text("Tutup"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }
}
