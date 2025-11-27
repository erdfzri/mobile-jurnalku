import 'package:flutter/material.dart';
import 'package:jurnalku/dashboard.dart';
import 'package:jurnalku/attitude_notes.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jurnalku',
      theme: ThemeData(
        primaryColor: const Color(0xFF1E56A0),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
          titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black87),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.black54),
          bodySmall: TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ),
      home: const LoginPage(),
    );
  }
}


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // topBackgroundHeight controls how much of the background image covers the top area
    const double topBackgroundHeight = 420;

    return Scaffold(
      body: Stack(
        children: [
          // Background image limited to top area only
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: topBackgroundHeight,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/images/login_bg.png',
                  fit: BoxFit.cover,
                  alignment: Alignment.centerRight,
                ),
                Container(color: Colors.black.withOpacity(0.35)),
              ],
            ),
          ),

          // Foreground content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  // Login card centered
                  Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 720, minWidth: 280),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.92),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.12), blurRadius: 12, offset: const Offset(0, 6))],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text("Jurnalku", style: TextStyle(color: Colors.indigo.shade900, fontSize: 26, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                            const SizedBox(height: 6),
                            Text("Masuk untuk memulai Jurnalku", style: TextStyle(color: Colors.indigo.shade800.withOpacity(0.9), fontSize: 14), textAlign: TextAlign.center),
                            const SizedBox(height: 18),
                            Text("Username", style: TextStyle(color: Colors.grey.shade800)),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey.shade300)),
                              child: const TextField(decoration: InputDecoration(border: InputBorder.none, hintText: "12345623")),
                            ),
                            const SizedBox(height: 12),
                            Text("Password", style: TextStyle(color: Colors.grey.shade800)),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey.shade300)),
                              child: const TextField(obscureText: true, decoration: InputDecoration(border: InputBorder.none, hintText: "••••••••")),
                            ),
                            const SizedBox(height: 18),
                            SizedBox(
                              height: 48,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainPage()));
                                },
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo.shade900, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                child: const Text('Masuk', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextButton(onPressed: () {}, child: Text("Lupa password? Hubungi guru laboran.", style: TextStyle(color: Colors.grey.shade700, fontSize: 13))),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Features Section on white background
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 36.0),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1100),
                        child: Column(
                          children: [
                            const Text("Menyatukan Upaya untuk Kemajuan Siswa", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black87), textAlign: TextAlign.center),
                            const SizedBox(height: 6),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Text(
                                "Jurnalku adalah aplikasi cerdas yang membantu guru dan siswa dalam memantau dan mengelola kompetensi keahlian siswa secara efektif.",
                                style: TextStyle(color: Colors.grey.shade600, fontSize: 13, height: 1.4),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(height: 24),
                            Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 28,
                              runSpacing: 18,
                              children: [
                                _featureItem(Icons.school_outlined, const Color(0xFFFDEDD0), 'Dirancang untuk Sekolah Kami', 'Dikembangkan khusus untuk memenuhi kebutuhan sekolah kami.'),
                                _featureItem(Icons.dashboard_customize, const Color(0xFFF1E6FF), 'Pemantauan yang Terstruktur', 'Memudahkan guru dalam menyusun dan memantau kompetensi.'),
                                _featureItem(Icons.build_outlined, const Color(0xFFEAF6FF), 'Fitur Praktis dan Bermanfaat', 'Reminder otomatis, grafik perkembangan, analisis mendalam.'),
                                _featureItem(Icons.person_add_outlined, const Color(0xFFFFF0E6), 'Pengajuan Kompetensi oleh Siswa', 'Siswa dapat mengajukan kompetensi untuk diverifikasi guru.'),
                                _featureItem(Icons.verified_user_outlined, const Color(0xFFE9FFF0), 'Validasi dan Tanda Tangan Guru', 'Validasi dan tanda tangan guru sebagai bukti resmi.'),
                                _featureItem(Icons.trending_up_outlined, const Color(0xFFFFEAF6), 'Pantauan Real-Time dan Transparan', 'Monitoring langsung untuk lingkungan belajar yang efisien.'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Footer (dark text to show on white)
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 28.0),
                    child: Column(
                      children: [
                        Text('© GEN-28 PPLG SMK Wikrama Bogor. All Rights Reserved.', style: TextStyle(color: Colors.black54, fontSize: 12), textAlign: TextAlign.center),
                        SizedBox(height: 6),
                        Row(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: [
                          Icon(Icons.check_circle, color: Colors.black54, size: 14),
                          SizedBox(width: 6),
                          Text('Validated schema', style: TextStyle(color: Colors.black54, fontSize: 12)),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// small reusable feature item used in the features grid
Widget _featureItem(IconData icon, Color bgColor, String title, String subtitle) {
  return SizedBox(
    width: 320,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(8)),
          child: Icon(icon, color: Colors.black87, size: 22),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black87)),
            const SizedBox(height: 4),
            Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey.shade700, height: 1.25)),
          ]),
        ),
      ],
    ),
  );
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const FeatureCard({super.key, required this.icon, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.shade300), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 4, offset: const Offset(0, 2))]),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(width: 48, height: 48, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.blue.shade100), child: Icon(icon, color: Colors.blue.shade700, size: 28)),
        const SizedBox(width: 12),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
            const SizedBox(height: 8),
            Text(description, style: TextStyle(color: Colors.grey.shade600, fontSize: 14, height: 1.4)),
          ]),
        ),
      ]),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[Dashboard(), AttitudeNotes()];

  void _onItemTapped(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _pages[_selectedIndex], bottomNavigationBar: BottomNavigationBar(currentIndex: _selectedIndex, onTap: _onItemTapped, selectedItemColor: Colors.indigo.shade800, unselectedItemColor: Colors.black54, items: const [
      BottomNavigationBarItem(icon: Icon(Icons.dashboard_outlined), activeIcon: Icon(Icons.dashboard), label: 'Dashboard'),
      BottomNavigationBarItem(icon: Icon(Icons.note_outlined), activeIcon: Icon(Icons.note), label: 'Catatan Sikap'),
    ]));
  }
}
