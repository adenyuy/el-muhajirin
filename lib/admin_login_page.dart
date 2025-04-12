import 'package:flutter/material.dart';

class AdminLoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Admin Login", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.grey[200],
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Admin Login', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF41966F))),
            SizedBox(height: 32),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: 'Username',
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // TODO: handle login logic
              },
              child: Text("Login"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF41966F),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 48, vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
