import 'package:flutter/material.dart';
import 'package:jurnalku/widgets/common_widgets.dart';
import 'package:jurnalku/attitude_notes.dart';
import 'package:jurnalku/profile.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: MyAppBar(
        userName: 'Erdi Eka Fazri',
        kelas: 'XII PPLG 4',
        onMenuSelected: (value) {
          if (value == 'Profil') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfilePage()));
            return;
          }
          if (value == 'Jurnal Pembiasaan' || value == 'Catatan Sikap') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const AttitudeNotes()));
            return;
          }
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Pilih: $value')));
        },
      ),
      // PERBAIKAN: Footer yang benar
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.grey.shade50,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '© GEN-28 PPLG SMK Wikrama Bogor. All Rights Reserved.',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle, color: Colors.grey.shade600, size: 14),
                const SizedBox(width: 6),
                Text(
                  'Validated schema',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero/banner
            SizedBox(
              height: 260,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF113F8C), Color(0xFF2E59B8)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                  Positioned(
                    left: -60,
                    top: -40,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.03),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    right: -80,
                    bottom: -60,
                    child: Container(
                      width: 240,
                      height: 240,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.04),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Selamat Datang di Jurnalku',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 36.0),
                          child: Text(
                            'Solusi cerdas untuk memantau perkembangan kompetensi siswa secara efektif',
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // Large rounded info card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2E59B8), Color(0xFF1F3E85)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                padding: const EdgeInsets.fromLTRB(40.0, 35.0, 40.0, 150.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Apa itu Jurnalku?',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Jurnalku adalah aplikasi cerdas yang membantu guru dan siswa dalam memantau dan mengelola kompetensi keahlian siswa secara efektif, terstruktur, dan real-time. Dengan fitur lengkap, proses pemantauan menjadi lebih mudah dan transparan.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.white70,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Feature Cards Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  _buildFeatureCard(
                    icon: Icons.school_outlined,
                    title: 'Dirancang Khusus',
                    description:
                        'Memenuhi kebutuhan spesifik sekolah kami dengan fokus pada kemajuan siswa.',
                  ),
                  const SizedBox(height: 16),
                  _buildFeatureCard(
                    icon: Icons.people_outline,
                    title: 'Efektif',
                    description:
                        'Memudahkan siswa dan guru melihat perkembangan secara real-time.',
                  ),
                  const SizedBox(height: 16),
                  _buildFeatureCard(
                    icon: Icons.school,
                    title: 'Terintegrasi',
                    description:
                        'Pengajuan kompetensi siswa, validasi dan laporan perkembangan yang transparan.',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Menu Aplikasi Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MENU APLIKASI',
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade200),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _buildMenuItem(
                          icon: Icons.person_outline,
                          title: 'Profil',
                          subtitle: 'Lihat dan kelola profilmu di sini.',
                          iconColor: Colors.blue,
                        ),
                        const Divider(height: 1),
                        _buildMenuItem(
                          icon: Icons.work_outline,
                          title: 'Portofolio',
                          subtitle:
                              'Lihat dan kelola portofolio kompetensimu di sini.',
                          iconColor: Colors.blue,
                        ),
                        const Divider(height: 1),
                        _buildMenuItem(
                          icon: Icons.verified_outlined,
                          title: 'Sertifikat',
                          subtitle:
                              'Lihat dan unduh sertifikat kompetensimu di sini.',
                          iconColor: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade200),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _buildMenuItem(
                          icon: Icons.book_outlined,
                          title: 'Jurnal Pembiasaan',
                          subtitle:
                              'Catat dan pantau kegiatan pembiasaan harianmu.',
                          iconColor: Colors.blue,
                        ),
                        const Divider(height: 1),
                        _buildMenuItem(
                          icon: Icons.people_outline,
                          title: 'Permintaan Saksi',
                          subtitle:
                              'Lihat teman yang mengajukan permintaan saksi.',
                          iconColor: Colors.blue,
                        ),
                        const Divider(height: 1),
                        _buildMenuItem(
                          icon: Icons.show_chart,
                          title: 'Progress',
                          subtitle:
                              'Lihat kemajuan kompetensi dan pencapaian belajarmu.',
                          iconColor: Colors.blue,
                        ),
                        const Divider(height: 1),
                        _buildMenuItem(
                          icon: Icons.warning_amber_outlined,
                          title: 'Catatan Sikap',
                          subtitle: 'Lihat catatan sikap dan perilaku.',
                          iconColor: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Statistik Kompetensi Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'STATISTIK KOMPETENSI',
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildStatCard(
                    title: 'Materi Diselesaikan',
                    value: '0',
                    status: 'Selesai',
                    statusColor: Colors.green,
                    icon: Icons.check_circle,
                    iconColor: Colors.green,
                  ),
                  const SizedBox(height: 12),
                  _buildStatCard(
                    title: 'Pengajuan Pending',
                    value: '0',
                    status: 'Pending',
                    statusColor: Colors.orange,
                    icon: Icons.schedule,
                    iconColor: Colors.orange,
                  ),
                  const SizedBox(height: 12),
                  _buildStatCard(
                    title: 'Materi Hari Ini',
                    value: '0',
                    status: 'Hari Ini',
                    statusColor: Colors.blue,
                    icon: Icons.calendar_today,
                    iconColor: Colors.blue,
                  ),
                  const SizedBox(height: 12),
                  _buildStatCard(
                    title: 'Materi Revisi',
                    value: '0',
                    status: 'Revisi',
                    statusColor: Colors.purple,
                    icon: Icons.refresh,
                    iconColor: Colors.purple,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Progress Akademik Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Progress Akademik',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildProgressRow('Selesai', 0, Colors.blue),
                    const SizedBox(height: 12),
                    _buildProgressRow('Pending', 0, Colors.purple),
                    const SizedBox(height: 12),
                    _buildProgressRow('Belum', 0, Colors.lightBlue.shade200),
                    const SizedBox(height: 12),
                    _buildProgressRow('Hari Ini', 0, Colors.cyan),
                    const SizedBox(height: 20),
                    Center(
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward),
                        label: const Text('Lihat Progress Kamu'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.blue,
                        ),
                      ),
                    ),
                    const Divider(height: 32),
                    const Center(
                      child: Text(
                        'Belum ada kompetensi / progress',
                        style: TextStyle(
                          color: Colors.blue,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward),
                        label: const Text('Lihat semua Kompetensi'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required String status,
    required Color statusColor,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(18.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: statusColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      status,
                      style: TextStyle(
                        fontSize: 13,
                        color: statusColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 28),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressRow(String label, int value, Color color) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(fontSize: 15, color: Colors.black87),
          ),
        ),
        Text(
          value.toString(),
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF2E59B8).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 48, color: const Color(0xFF2E59B8)),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color iconColor,
  }) {
    return Builder(
      builder: (context) {
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(fontSize: 13, color: Colors.black54),
          ),
          trailing: const Icon(Icons.chevron_right, color: Colors.black54),
          onTap: () {
            if (title == 'Profil') {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage(initialTab: 0)));
              return;
            }
            if (title == 'Portofolio') {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage(initialTab: 1)));
              return;
            }
            if (title == 'Sertifikat') {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage(initialTab: 2)));
              return;
            }
            if (title == 'Jurnal Pembiasaan' || title == 'Catatan Sikap') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AttitudeNotes()),
              );
              return;
            }
          },
        );
      },
    );
  }
}