import 'package:flutter/material.dart';
import 'screens/splash_screen.dart'; // Pastikan path benar
import 'home.dart';
import 'calendar.dart';
import 'prayer.dart';
import 'others.dart';
import 'news.dart'; // Import the news.dart file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // SplashScreen pertama kali muncul
      routes: {
        '/home': (context) => MainPage(), // Route to MainPage
        '/news': (context) => NewsPage(title: 'News Title'), // Route to NewsPage
      },
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    CalendarPage(),
    PrayerPage(),
    OthersPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Color(0xFF41966F),
        unselectedItemColor: Color(0xFF41966F),
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Image.asset("assets/images/home-icon.png", width: 24), label: "Home"),
          BottomNavigationBarItem(icon: Image.asset("assets/images/calendar-icon.png", width: 24), label: "Calendar"),
          BottomNavigationBarItem(icon: Image.asset("assets/images/prayer-icon.png", width: 24), label: "Prayer"),
          BottomNavigationBarItem(icon: Image.asset("assets/images/others-icon.png", width: 24), label: "Others"),
        ],
      ),
    );
  }
}