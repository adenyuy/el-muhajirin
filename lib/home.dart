import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            SizedBox(height: 40),
            _buildQuoteSection(),
            SizedBox(height: 20),
            _buildNewsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/mosque-background.png"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Ahlan wa sahlan", style: TextStyle(fontSize: 18, color: Colors.white)),
                Text("Sahabat Masjid", style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () => _showDonationPopup(context),
          child: _buildPaymentCard(),
        ),
      ],
    );
  }

  Widget _buildPaymentCard() {
    return Container(
      margin: EdgeInsets.only(top: 130, left: 16, right: 16),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(colors: [Color(0xFF41966F), Color(0xFF41C689)]),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))],
      ),
      child: Column(
        children: [
          Row(
            children: [
              _buildIconContainer(),
              SizedBox(width: 12),
              _buildMasjidInfo(),
            ],
          ),
          SizedBox(height: 12),
          _buildPaymentDetails(),
        ],
      ),
    );
  }

  Widget _buildIconContainer() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
      child: Icon(Icons.mosque, color: Colors.white, size: 60),
    );
  }

  Widget _buildMasjidInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Masjid Al-Muhajirin", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
        Text("Alamat lokasi", style: TextStyle(fontSize: 14, color: Colors.white)),
      ],
    );
  }

  Widget _buildPaymentDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("24 Maret 2025", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(20)),
          child: Text("Rp. 2.300.000", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
        ),
      ],
    );
  }

  Widget _buildQuoteSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(colors: [Color(0xFF41966F), Color(0xFF41C689)]),
        ),
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Row(
            children: [
              Image.asset("assets/images/quote-logos.png", width: 60, height: 60),
              SizedBox(width: 20),
              Expanded(child: Text("Barangsiapa yang mencintai masjid, maka Allah mencintainya.", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNewsSection() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Berita Kegiatan", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 180,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) => setState(() => _currentPage = index),
                  children: [
                    _buildNewsItem("assets/images/berita-1.png", "Judul Berita 1"),
                    _buildNewsItem("assets/images/berita-2.png", "Judul Berita 2"),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                top: 70,
                child: IconButton(
                  icon: Image.asset("assets/images/back-icon.png", width: 24, height: 24),
                  onPressed: _currentPage > 0 ? () => _pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut) : null,
                ),
              ),
              Positioned(
                right: 0,
                top: 70,
                child: IconButton(
                  icon: Image.asset("assets/images/next-icon.png", width: 24, height: 24),
                  onPressed: _currentPage < 1 ? () => _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut) : null,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNewsItem(String imagePath, String title) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
              ),
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Image.asset("assets/images/back-icon.png", width: 24, height: 24),
          onPressed: _currentPage > 0 ? () => _pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut) : null,
        ),
        IconButton(
          icon: Image.asset("assets/images/next-icon.png", width: 24, height: 24),
          onPressed: _currentPage < 1 ? () => _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut) : null,
        ),
      ],
    );
  }

  void _showDonationPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: SingleChildScrollView(child: Container(padding: EdgeInsets.all(20), child: DonationList())),
      ),
    );
  }
}

class DonationList extends StatefulWidget {
  @override
  _DonationListState createState() => _DonationListState();
}

class _DonationListState extends State<DonationList> {
  List<bool> _isExpanded = List.generate(12, (index) => false);
  List<String> months = ["Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli", "Agustus", "September", "Oktober", "November", "Desember"];
  final double startingBalance = 1000000;
  final List<Map<String, double>> expenses = [
    {"Listrik": 400000},
    {"Air": 200000},
    {"Biaya Operasional": 100000},
  ];

  double calculateEndingBalance() => startingBalance - expenses.fold(0, (sum, expense) => sum + expense.values.first);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Kas Masjid", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 20),
        ...List.generate(months.length, (index) => _buildMonthRow(index)),
        SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF41966F), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12)),
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Tutup", style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }

  Widget _buildMonthRow(int index) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(months[index], style: TextStyle(fontSize: 16))),
              Text("Rp. ${calculateEndingBalance().toStringAsFixed(0)}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              GestureDetector(
                onTap: () => setState(() => _isExpanded[index] = !_isExpanded[index]),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Image.asset("assets/images/drop-down-icon.png", width: 18, height: 18),
                ),
              ),
            ],
          ),
        ),
        if (_isExpanded[index]) _buildExpenseDetails(),
      ],
    );
  }

  Widget _buildExpenseDetails() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(color: Colors.lightGreen.withOpacity(0.1), borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.green.withOpacity(0.3))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Detail Kas Masjid", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            _buildBalanceRow("Saldo Awal:", startingBalance),
            SizedBox(height: 8),
            Text("Pengeluaran:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            ...expenses.map((expense) => _buildExpenseRow(expense)).toList(),
            SizedBox(height: 8),
            Divider(color: Colors.green.withOpacity(0.5)),
            SizedBox(height: 8),
            _buildBalanceRow("Saldo Akhir:", calculateEndingBalance()),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceRow(String label, double amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(label, style: TextStyle(fontSize: 16))),
        Text("Rp. ${amount.toStringAsFixed(0)}", style: TextStyle(fontSize: 16, color: label == "Saldo Akhir:" ? Colors.black : Colors.green)),
      ],
    );
  }

  Widget _buildExpenseRow(Map<String, double> expense) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text("• ${expense.keys.first}", style: TextStyle(fontSize: 14))),
        Text("Rp. ${expense.values.first.toStringAsFixed(0)}", style: TextStyle(fontSize: 14, color: Colors.red)),
      ],
    );
  }
}