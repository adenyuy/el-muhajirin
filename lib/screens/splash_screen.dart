import 'package:flutter/material.dart';
import '../main.dart'; // Ganti HomePage ke MainPage
import 'package:lottie/lottie.dart'; 

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MainPage()), // Arahkan ke MainPage agar BottomNavigationBar tetap ada
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset(
              'assets/animations/splash_animation.json', // Pastikan file ini ada di folder assets/lottie/
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'El - Muhajirin',
            style: TextStyle(
              fontFamily: 'Quintessential', // Gunakan font dari assets/fonts
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
