import 'package:flutter/material.dart';

class JurnalPembiasaan extends StatefulWidget {
  const JurnalPembiasaan({super.key});

  @override
  State<JurnalPembiasaan> createState() => _JurnalPembiasaanState();
}

class _JurnalPembiasaanState extends State<JurnalPembiasaan> {
  Map<String, bool> habitCheck = {};
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fa),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          "Jurnal Pembiasaan",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPembiasaanSection(),
              const SizedBox(height: 20),
              _buildSection(
                iconText: 'B',
                title: 'Pekerjaan yang dilakukan',
                subtitle: 'Daftar pekerjaan harian beserta status dan saksi',
                columns: const ['PEKERJAAN', 'TANGGAL', 'SAKSI', 'STATUS'],
                noDataText: 'Belum ada pekerjaan yang diinput.',
                addButtonText: 'Tambah Pekerjaan',
              ),
              const SizedBox(height: 20),
              _buildSection(
                iconText: 'C',
                title: 'Materi yang dipelajari',
                subtitle:
                    'Daftar materi, status, catatan guru, dan catatan siswa',
                columns: const [
                  'MATERI',
                  'TANGGAL',
                  'STATUS',
                  'CATATAN GURU',
                  'CATATAN SISWA'
                ],
                noDataText: 'Belum ada materi yang diinput.',
                addButtonText: 'Tambah Materi',
              ),
              const SizedBox(height: 20),
              _buildPointsSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPembiasaanSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.grey.shade200,
                    child: const Text(
                      'A',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Pembiasaan Harian',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ],
              ),

              // tanggalnya yang di pojok
              TextButton(
                onPressed: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2024),
                    lastDate: DateTime(2030),
                  );

                  if (picked != null) {
                    setState(() {
                      selectedDate = picked;
                    });
                  }
                },
                child: Text(
                  selectedDate == null
                      ? "Pilih Tanggal"
                      : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 4),
          const Text(
            "Jurnal keseharian selama minggu produktif",
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
          const SizedBox(height: 16),

          // kategori 1
          _buildHabitCategory(
            title: "Keselamatan dan Kesehatan Kerja",
            habits: [
              "Pencahayaan dan sirkulasi udara baik.",
              "Duduk ergonomis dan posisi tubuh nyaman.",
              "Pergelangan tangan sejajar keyboard.",
              "Posisi tubuh tidak membungkuk.",
              "Istirahatkan mata tiap 30 menit.",
              "Stretching tiap 1 jam.",
              "Minum air 200 ml tiap 2 jam.",
            ],
          ),

          // kategori 2
          _buildHabitCategory(
            title: "Keselamatan",
            habits: [
              "Tidak bekerja sambil makan/minum.",
              "Kabel tertata rapi.",
              "Fokus dan kontak mata.",
              "Periksa peralatan kerja sebelum dipakai.",
            ],
          ),

          // kategori 3
          _buildHabitCategory(
            title: "Karakter",
            habits: [
              "Berdoa sebelum dan sesudah bekerja.",
              "Disiplin masuk kerja.",
              "Berkomitmen pada tugas.",
              "Menjaga kebersihan area kerja.",
              "Menghormati rekan kerja.",
              "Terbiasa wajib ngulik & problem solving.",
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHabitCategory({
    required String title,
    required List<String> habits,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 12),
        childrenPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        children: [
          for (String habit in habits) _buildHabitCheckbox(habit),
        ],
      ),
    );
  }

  // checkbox bulet-bulet
  Widget _buildHabitCheckbox(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                habitCheck[text] = !(habitCheck[text] ?? false);
              });
            },
            child: Icon(
              habitCheck[text] == true
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: Colors.blue,
              size: 22,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  // bagian b sama c
  Widget _buildSection({
    required String iconText,
    required String title,
    required String subtitle,
    required List<String> columns,
    required String noDataText,
    required String addButtonText,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.grey.shade200,
                child: Text(
                  iconText,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black87),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),

          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 10),

          ExpansionTile(
            tilePadding: EdgeInsets.zero,
            childrenPadding: const EdgeInsets.symmetric(vertical: 8),
            title: const Text(
              "Data",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            children: [
              ListTile(
                title:
                    Text(noDataText, style: const TextStyle(color: Colors.grey)),
              ),
            ],
          ),

          const SizedBox(height: 8),
          TextButton(
            onPressed: () {},
            child: Text('+ $addButtonText'),
          ),
        ],
      ),
    );
  }

  // bagian d
  Widget _buildPointsSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                child: Text(
                  'D',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black87),
                ),
              ),
              SizedBox(width: 8),
              Text(
                'Poin',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 4),
          Text(
            'Rekap kategori poin dan total mingguan',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 10),
          ExpansionTile(
            tilePadding: EdgeInsets.zero,
            childrenPadding: EdgeInsets.symmetric(vertical: 8),
            title: Text(
              "Data Poin",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            children: [
              ListTile(
                title: Text(
                  "Belum ada data poin.",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}