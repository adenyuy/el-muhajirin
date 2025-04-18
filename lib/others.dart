import 'package:flutter/material.dart';

class OthersPage extends StatefulWidget {
  @override
  _OthersPageState createState() => _OthersPageState();
}

class _OthersPageState extends State<OthersPage> {
  @override
  void initState() {
    super.initState();
    // Show the modal after the first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showSelectionModal(context);
    });
  }

  void _showSelectionModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _optionTile(
                context,
                icon: Icons.people,
                title: 'DKM Masjid',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/dkm');
                },
              ),
              SizedBox(height: 12),
              _optionTile(
                context,
                icon: Icons.developer_mode,
                title: 'Pengembang Aplikasi',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/dev');
                },
              ),
              SizedBox(height: 24),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/admin-login');
                },
                child: Text(
                  'Ingin masuk mode Admin? klik disini',
                  style: TextStyle(
                    color: Colors.grey[700],
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _optionTile(BuildContext context,
      {required IconData icon, required String title, required VoidCallback onTap}) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      tileColor: Color(0xFF41966F).withOpacity(0.1),
      leading: Icon(icon, color: Color(0xFF41966F)),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink(); // halaman kosong, gak nampilin apa-apa
  }
}
