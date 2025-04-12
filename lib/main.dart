import 'package:flutter/material.dart';

// Importing necessary screens
import 'screens/splash_screen.dart';
import 'home.dart';
import 'calendar.dart';
import 'prayer.dart';
import 'dkm_page.dart';
import 'developer_page.dart';
import 'admin_login_page.dart';
import 'news.dart';

/// Entry point of the application
void main() {
  runApp(MyApp());
}

/// Main application widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Splash screen shown at the start
      home: SplashScreen(),
      // Route definitions
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

/// MainPage serves as the container for bottom navigation and modal
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

/// State for MainPage
class _MainPageState extends State<MainPage> {
  // Current index of bottom navigation
  int _currentIndex = 0;

  // List of main pages accessible through bottom navigation
  final List<Widget> _pages = [
    HomePage(),       // Index 0 - Home
    CalendarPage(),   // Index 1 - Calendar
    PrayerPage(),     // Index 2 - Prayer
    Container(),      // Index 3 - Placeholder for 'Others' modal
  ];

  /// Function to show a modal bottom sheet when 'Others' is tapped
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
              // List tile for DKM page
              ListTile(
                leading: Icon(Icons.people, color: Color(0xFF41966F)),
                title: Text('DKM Masjid'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/dkm');
                },
              ),
              // List tile for developer page
              ListTile(
                leading: Icon(Icons.code, color: Color(0xFF41966F)),
                title: Text('Pengembang Aplikasi'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/dev');
                },
              ),
              SizedBox(height: 16),
              // Button to go to admin login page
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

  // Bottom navigation bar for all pages
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Display the selected page
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          // If 'Others' is tapped, show modal
          if (index == 3) {
            _showOthersModal();
          } else {
            // Update current index to show selected page
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
