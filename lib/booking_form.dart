import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingFormPage extends StatefulWidget {
  const BookingFormPage({super.key});

  @override
  _BookingFormPageState createState() => _BookingFormPageState();
}

class _BookingFormPageState extends State<BookingFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _teleponController = TextEditingController();
  final TextEditingController _tujuanController = TextEditingController();
  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _waktuMulaiController = TextEditingController();
  final TextEditingController _waktuAkhirController = TextEditingController();

  // Fungsi untuk memilih tanggal
  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _tanggalController.text = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }

  // Fungsi untuk memilih waktu
  Future<void> _pickTime(TextEditingController controller) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        controller.text = picked.format(context);
      });
    }
  }

  // Fungsi untuk menampilkan popup konfirmasi
  void _showConfirmationDialog() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            title: const Text("Konfirmasi Booking"),
            content: const Text("Apakah Anda yakin data sudah benar?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context), // Tutup popup
                child: const Text("Batal"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Tutup popup
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Booking berhasil!"),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                child: const Text("Ya, Booking"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9C27B0), // Warna ungu sesuai gambar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Formulir Booking Aula",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Waktu Mulai & Waktu Akhir
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _waktuMulaiController,
                      label: "Waktu mulai",
                      readOnly: true,
                      onTap: () => _pickTime(_waktuMulaiController),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildTextField(
                      controller: _waktuAkhirController,
                      label: "Waktu akhir",
                      readOnly: true,
                      onTap: () => _pickTime(_waktuAkhirController),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              _buildTextField(
                  controller: _namaController, label: "Nama Lengkap"),
              _buildTextField(
                  controller: _teleponController,
                  label: "Nomor telepon",
                  isNumber: true),
              _buildTextField(
                  controller: _tujuanController, label: "Tujuan acara"),
              _buildTextField(
                controller: _tanggalController,
                label: "Tanggal acara",
                readOnly: true,
                onTap: _pickDate,
              ),

              const SizedBox(height: 20),

              // Tombol Booking
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 24),
                  ),
                  onPressed: _showConfirmationDialog,
                  child: const Text(
                    "Booking",
                    style: TextStyle(color: Colors.purple, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi reusable untuk membuat text field
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    bool readOnly = false,
    bool isNumber = false,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        readOnly: readOnly,
        keyboardType: isNumber ? TextInputType.phone : TextInputType.text,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white),
          filled: true,
          fillColor: Colors.deepPurple.shade700,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "$label tidak boleh kosong";
          }
          return null;
        },
        onTap: onTap,
      ),
    );
  }

  @override
  void dispose() {
    _namaController.dispose();
    _teleponController.dispose();
    _tujuanController.dispose();
    _tanggalController.dispose();
    _waktuMulaiController.dispose();
    _waktuAkhirController.dispose();
    super.dispose();
  }
}
