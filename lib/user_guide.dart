import 'package:flutter/material.dart';
import 'package:jurnalku/widgets/common_widgets.dart';

class UserGuide extends StatefulWidget {
  const UserGuide({super.key});

  @override
  State<UserGuide> createState() => _UserGuideState();
}

class _UserGuideState extends State<UserGuide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      appBar: const MyAppBar(
        userName: 'Erdi Eka Fazri',
        kelas: 'XII PPLG 4',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: ListView(
          children: [
            Row(
              children: const [
                Icon(Icons.menu_book_outlined,
                    color: Color(0xFF1A73E8), size: 28),
                SizedBox(width: 10),
                Text(
                  "Panduan Penggunaan",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1A73E8),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Text(
              "Selamat datang di panduan penggunaan aplikasi Jurnalku. "
              "Panduan ini akan membantu Anda memahami cara menggunakan fitur-fitur "
              "yang tersedia dengan optimal.",
              style: TextStyle(
                fontSize: 15,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              "Umum",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
            Divider(),
            const SizedBox(height: 15),
            buildGuideTile(
              title: "Unggah Profile",
              subtitle: "Panduan untuk mengunggah profile pengguna",
            ),
            const SizedBox(height: 12),
            buildGuideTile(
              title: "Ganti Password",
              subtitle: "Panduan untuk mengganti password pengguna",
            ),
            const SizedBox(height: 25),
            const Text(
              "Untuk Siswa",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
            Divider(),
            const SizedBox(height: 15),
            buildGuideTile(
              title: "Mengisi Jurnal",
              subtitle: "Panduan untuk mengisi kegiatan sehari - hari",
            ),
            const SizedBox(height: 12),
            buildGuideTile(
              title: "kelengkapan Profile",
              subtitle: "Panduan untuk melengkapi profile",
            ),
            const SizedBox(height: 12),
            buildGuideTile(
              title: "Mengelola Portofolio",
              subtitle: "Panduan untuk menambah, edit, dan hapus portofolio",
            ),
            const SizedBox(height: 12),
            buildGuideTile(
              title: "Mengelola Sertifikat",
              subtitle: "Panduan untuk menambah, edit, dan hapus portofolio",
            ),
            const SizedBox(height: 12),
            buildGuideTile(
              title: "Catatan Sikap Saya",
              subtitle: "Panduan untuk melihat dan memahami catatan sikap",
            ),
          ],
        ),
      ),
    );
  }

 Widget buildGuideTile({required String title, required String subtitle}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey.shade200),
      boxShadow: [
        BoxShadow(
          blurRadius: 3,
          offset: const Offset(0, 1),
          color: Colors.black12.withOpacity(0.05),
        )
      ],
    ),
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFE8F1FF),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.notes_rounded,
            color: Color(0xFF1A73E8),
            size: 18,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 12,
                  height: 1.3,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
}