import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jurnalku/widgets/common_widgets.dart';

class LearningProgress extends StatefulWidget {
  const LearningProgress({super.key});

  @override
  State<LearningProgress> createState() => _LearningProgressState();
}

class _LearningProgressState extends State<LearningProgress> {
  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('EEEE, d MMMM yyyy', 'id_ID').format(DateTime.now());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MyAppBar(
        userName: 'Erdi Eka Fazri',
        kelas: 'XII PPLG 4',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Progress Belajar',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Pantau perkembangan kompetensi \ndan materi pembelajaran Anda',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F1FF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    formattedDate,
                    style: const TextStyle(
                      color: Color(0xFF1A73E8),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            Row(
              children: [
                Expanded(child: buildCard(
                  colorDot: Colors.blue,
                  title: "Total \nPengajuan",
                  number: "2",
                  icon: Icons.check_circle,
                  bgIcon: const Color(0xFFE7F0FF),
                  iconColor: Colors.blue,
                )),
                const SizedBox(width: 8),
                Expanded(child: buildCard(
                  colorDot: Colors.green,
                  title: "Halaman \nIni",
                  number: "0",
                  icon: Icons.event,
                  bgIcon: const Color(0xFFE9FFE9),
                  iconColor: Colors.green,
                )),
                const SizedBox(width: 8),
                Expanded(child: buildCard(
                  colorDot: Colors.orange,
                  title: "Status \nPending",
                  number: "0",
                  icon: Icons.timer,
                  bgIcon: const Color(0xFFFFF2DD),
                  iconColor: Colors.orange,
                )),
                const SizedBox(width: 8),
                Expanded(child: buildCard(
                  colorDot: Colors.purple,
                  title: "Total \nHalaman",
                  number: "1",
                  icon: Icons.public,
                  bgIcon: const Color(0xFFF0E7FF),
                  iconColor: Colors.purple,
                )),
              ],
            ),

            const SizedBox(height: 30),

            Expanded(
              child: ListView(
                children: [
                  buildBigCard(
                    title: "Project Work",
                    subtitle: "Kompetensi dan materi pembelajaran",
                  ),
                  const SizedBox(height: 20),
                  buildBigCard(
                    title: "Mobile Apps",
                    subtitle: "Kompetensi dan materi pembelajaran",
                  ),
                  buildBigCard(
                    title: "UKK (Uji Kompetensi Keahlian)",
                    subtitle: "Kompetensi dan materi pembelajaran",
                  ),
                  const SizedBox(height: 20),
                  buildBigCard(
                    title: "GIM",
                    subtitle: "Kompetensi dan materi pembelajaran",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildCard({
    required Color colorDot,
    required String title,
    required String number,
    required IconData icon,
    required Color iconColor,
    required Color bgIcon,
  }) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Colors.black26.withOpacity(0.03),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: colorDot,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                number,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: bgIcon,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildBigCard({required String title, required String subtitle}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("KOMPETENSI", style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600)),
              Text("GURU", style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600)),
              Text("TANGGAL", style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600)),
              Text("STATUS", style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600)),
              Text("CATATAN GURU", style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600)),
              Text("CATATAN SISWA", style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
