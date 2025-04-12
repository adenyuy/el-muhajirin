import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Displays a full-screen dialog with a zoomable image when tapped.
///
/// [context]: The BuildContext of the widget.
/// [imagePath]: The path of the image to display.
void _showImageDialog(BuildContext context, String imagePath) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      insetPadding: EdgeInsets.all(10),
      backgroundColor: Colors.transparent,
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: InteractiveViewer(
          child: Image.asset(imagePath, fit: BoxFit.contain),
        ),
      ),
    ),
  );
}

/// A stateless widget that displays a news article page.
/// Includes title, author, date, image, and detailed content.
class NewsPage extends StatelessWidget {
  final String title;

  NewsPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // News headline
              Text(
                "Kegiatan Buka Puasa Bersama Hari Senin 23 Maret 2025",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),

              // Author and date information
              Text(
                "Oleh: Virgio Mahardika",
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
              Text(
                "Tanggal: 23 Maret 2025",
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 16),

              // Main news image with zoom feature
              GestureDetector(
                onTap: () => _showImageDialog(context, "assets/images/gambar-berita.jpg"),
                child: Image.asset("assets/images/gambar-berita.jpg"),
              ),
              SizedBox(height: 16),

              // Main article content
              Text(
                "Langit sore di atas Lapangan Al-Muchtar, Al-Muhajirin Kampus Pusat, terlihat cerah. Angin sepoi membawa kesejukan, menemani ratusan keluarga besar Pondok Pesantren Al-Muhajirin yang telah berkumpul. Mereka datang dengan hati yang penuh suka cita, menanti saat berbuka puasa bersama dalam rangkaian acara silaturahmi di penghujung Ramadan.\n\n"
                    "Lantunan ayat suci Al-Qur’an menggema di seluruh lapangan. Sejak selepas Ashar, ratusan guru, staf, dan karyawan telah duduk bersila, melantunkan tadarus Al-Qur’an dengan khidmat. Suara mereka berpadu merdu, menciptakan harmoni yang membawa ketenangan, seakan mengundang keberkahan turun menyelimuti setiap hati yang hadir.\n\n"
                    "Agenda buka puasa bersama ini bukan sekadar momen berbagi hidangan. Ia menjadi ajang mempererat ukhuwah, menguatkan kebersamaan.\n\n"
                    "Dihadiri oleh lebih dari 900 orang yang terdiri dari guru, staf, dan karyawan Al-Muhajirin, acara ini menjadi salah satu momen terbesar yang digelar menjelang Idul Fitri.\n\n"
                    "Ketua Yayasan Al-Muhajirin, Dr. Hj. Ifa Faizah Rohmah, M.Pd, dalam sambutannya menekankan betapa pentingnya persatuan dalam keluarga besar Al-Muhajirin. “Kita menutup Ramadan ini dengan silaturahmi bersama. Al-Muhajirin memiliki 900 karyawan, dan bila dihitung dengan mitra, totalnya mencapai 1.400 orang. Itu sebabnya, kami menyediakan 1.400 paket parsel lebaran sebagai bentuk apresiasi dan kebersamaan,” ujarnya, Minggu 23 Maret 2025.\n\n"
                    "Tak sekadar berkumpul, acara ini juga menjadi momentum refleksi. Ramadan mengajarkan nilai-nilai keikhlasan, kebersamaan, dan pengabdian. Al-Muhajirin, sebagai lembaga pendidikan dan dakwah, ingin terus memberikan manfaat yang lebih luas bagi masyarakat.\n\n"
                    "“Kita ingin keluarga besar Al-Muhajirin terus bersatu dan maju, serta memberikan manfaat lebih luas untuk Purwakarta Istimewa dan Jawa Barat Istimewa,” tambahnya.\n\n"
                    "Acara ini juga dihadiri oleh berbagai tokoh penting, termasuk Staf Ahli Bupati Bidang Pemerintahan, H. Dicky Darmawan, S.H., M.Hum, yang hadir mewakili Bupati Purwakarta.\n\n"
                    "“Terima kasih atas undangannya. Kami mengapresiasi kegiatan ini. Mudah-mudahan membawa keberkahan bagi kita semua,” ujarnya dalam sambutan.\n\n"
                    "Selain itu, perwakilan dari Kapolres Purwakarta, Dandim, PCNU Purwakarta, serta PWNU Jawa Barat turut hadir, menunjukkan betapa eratnya hubungan Al-Muhajirin dengan masyarakat dan pemerintah.\n\n"
                    "Sebagai institusi pendidikan Islam yang telah melahirkan banyak kader terbaik, Al-Muhajirin terus menunjukkan komitmennya dalam membangun kualitas sumber daya manusia.\n\n"
                    "Tahun ini, sebanyak 15 santri tahfidz Al-Muhajirin Kampus 5, telah berhasil menghafal 30 juz Al-Qur’an—sebuah pencapaian baik yang menjadi bukti keberhasilan sistem pendidikan tahfidz di pesantren ini.\n\n"
                    "Tak hanya itu, para santri Al-Muhajirin juga menorehkan prestasi di bidang akademik. Dari SMA dan MA Al-Muhajirin Kampus Pusat, tercatat 19 santri lulus melalui jalur SNBP, sementara dari SMA Fullday Al-Muhajirin Kampus 2, sebanyak 9 santri diterima di perguruan tinggi melalui jalur SNBP.\n\n"
                    "Sementara itu, dalam kancah internasional, Al-Muhajirin juga terus mengirimkan kader terbaiknya ke luar negeri. Belum lama ini, Syaikhuna Prof. Dr. KH. Abun Bunyamin, MA, secara langsung mengantar santri ke Mesir untuk melanjutkan pendidikan di Universitas Al-Azhar.\n\n"
                    "Ketua Yayasan Al-Muhajirin menutup sambutannya dengan pesan mendalam:\n\n"
                    "“Bersama-sama kita berada dalam perahu kebanggaan ini—perahu Al-Muhajirin. Kita ingin menggapai ridha Allah dengan bimbingan para kiai, para ulama. Mari kita saling membebaskan, saling mengikhlaskan, dan saling memaafkan. Semoga Allah menerima doa-doa kita, mengampuni dosa-dosa kita, dan melapangkan hati kita.”\n\n"
                    "Matahari mulai tenggelam. Lantunan ayat suci Al-Qur’an menggema, mengiringi suasana khidmat di lapangan. Setelah tadarus khatam Al-Qur’an, azan maghrib berkumandang. Ratusan hadirin serempak mengucap doa berbuka, lalu menyeruput air, menikmati kurma, dan melanjutkan dengan shalat maghrib berjamaah.\n\n"
                    "Ramadan hampir berlalu, tetapi semangat dan nilai-nilai yang ditanamkan di dalamnya akan terus menyala. Al-Muhajirin, dengan komitmennya dalam pendidikan dan dakwah, terus mencetak generasi unggul, dan juga menjadi bagian dari perjalanan mewujudkan Purwakarta Istimewa dan Jawa Barat Istimewa.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),

              // Documentation section
              Text(
                "Dokumentasi Kegiatan:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),

              // Documentation image gallery
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // First image
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _showImageDialog(context, "assets/images/gambar-berita.jpg"),
                      child: Image.asset("assets/images/gambar-berita.jpg", fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 8),

                  // Second image
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _showImageDialog(context, "assets/images/dokumentasi-1.jpg"),
                      child: Image.asset("assets/images/dokumentasi-1.jpg", fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 8),

                  // Third image
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _showImageDialog(context, "assets/images/dokumentasi-2.jpg"),
                      child: Image.asset("assets/images/dokumentasi-2.jpg", fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 8),

                  // Fourth image
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _showImageDialog(context, "assets/images/dokumentasi-3.jpg"),
                      child: Image.asset("assets/images/dokumentasi-3.jpg", fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
