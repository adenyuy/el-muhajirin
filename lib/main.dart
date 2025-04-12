import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'home.dart';
import 'calendar.dart';
import 'prayer.dart';
// OthersPage tidak perlu dipakai karena diganti modal
import 'dkm_page.dart';
import 'developer_page.dart';
import 'admin_login_page.dart';
import 'news.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/home': (context) => MainPage(),
        '/news': (context) => NewsPage(title: 'News Title'),
        '/dkm': (context) => DkmPage(),
        '/dev': (context) => DeveloperPage(),
        '/admin-login': (context) => AdminLoginPage(),
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
    Container(), // Placeholder untuk Others
  ];

  void _showOthersModal() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.people, color: Color(0xFF41966F)),
                title: Text('DKM Masjid'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/dkm');
                },
              ),
              ListTile(
                leading: Icon(Icons.code, color: Color(0xFF41966F)),
                title: Text('Pengembang Aplikasi'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/dev');
                },
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/admin-login');
                },
                child: Text(
                  'Ingin masuk mode Admin? klik disini',
                  style: TextStyle(
                    color: Color(0xFF41966F),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 3) {
            _showOthersModal();
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
        selectedItemColor: Color(0xFF41966F),
        unselectedItemColor: Color(0xFF41966F),
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/home-icon.png", width: 24),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/calendar-icon.png", width: 24),
            label: "Calendar",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/prayer-icon.png", width: 24),
            label: "Prayer",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/others-icon.png", width: 24),
            label: "Others",
          ),
        ],
      ),
    );
  }
}
