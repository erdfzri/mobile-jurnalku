import 'package:flutter/material.dart';
import 'package:jurnalku/widgets/common_widgets.dart';
import 'package:jurnalku/attitude_notes.dart';

class ProfilePage extends StatefulWidget {
  final int initialTab;

  const ProfilePage({super.key, this.initialTab = 0});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: widget.initialTab);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: MyAppBar(
        userName: 'Erdi Eka Fazri',
        kelas: 'PPLG XII-4',
        onMenuSelected: (value) {
          if (value == 'Log Out') {
            Navigator.of(context).pushNamedAndRemoveUntil('/', (_) => false);
            return;
          }
          if (value == 'Catatan Sikap' || value == 'Jurnal Pembiasaan') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const AttitudeNotes()));
            return;
          }
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Pilih: $value')));
        },
      ),
      bottomNavigationBar: const MyFooter(
        child: '© GEN-28 PPLG SMK Wikrama Bogor. All Rights Reserved.',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Cover + Avatar
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 160,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://picsum.photos/seed/cover/1200/400'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Positioned(
                  left: 20,
                  top: 100,
                  child: CircleAvatar(
                    radius: 44,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage('https://picsum.photos/seed/profile/200'),
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 120,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.share, size: 18),
                    label: const Text('Bagikan'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E56A0),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 60),

            // Name and Meta
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Erdi Eka Fazri',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '12309620 | PPLG XII-4 | Cic 7',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // TabBar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TabBar(
                controller: _tabController,
                indicatorColor: const Color(0xFF1E56A0),
                indicatorWeight: 3,
                labelColor: const Color(0xFF1E56A0),
                unselectedLabelColor: Colors.black54,
                tabs: const [
                  Tab(text: 'Overview'),
                  Tab(text: 'Portfolio'),
                  Tab(text: 'Sertifikat'),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Tab Content
            SizedBox(
              height: 600,
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Overview Tab
                  _buildOverviewTab(theme),
                  // Portfolio Tab
                  _buildPortfolioTab(theme),
                  // Sertifikat Tab
                  _buildSertifikatTab(theme),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewTab(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // 2 Column Layout: Portfolio & Sertifikat (left) + Dokumen & Media (right)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left: Portfolio + Sertifikat
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      // Portfolio Card
                      Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 0,
                        child: Container(
                          height: 140,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.work_outline, size: 40, color: Colors.grey.shade400),
                              const SizedBox(height: 8),
                              Text(
                                'Portfolio akan\nditampilkan di sini',
                                style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Sertifikat Card
                      Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 0,
                        child: Container(
                          height: 140,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.emoji_events_outlined, size: 40, color: Colors.orange.shade400),
                              const SizedBox(height: 8),
                              Text(
                                'Sertifikat akan\nditampilkan di sini',
                                style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                // Right: Dokumen + Media Sosial
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      // Dokumen Card
                      Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dokumen',
                                style: theme.textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 12),
                              // CV
                              _buildDocumentItem(
                                title: 'Curriculum Vitae',
                                subtitle: 'Dokumen CV siswa',
                                buttonColor: Colors.blue.shade700,
                                buttonText: 'Lihat CV',
                                icon: Icons.description_outlined,
                              ),
                              const SizedBox(height: 10),
                              // Kartu Pelajar
                              _buildDocumentItem(
                                title: 'Kartu Pelajar',
                                subtitle: 'Kartu identitas siswa',
                                buttonColor: Colors.green.shade700,
                                buttonText: 'Lihat Kartu Pelajar',
                                icon: Icons.card_membership_outlined,
                                warningText: 'Kartu pelajar dapat dilihat oleh anda dan guru',
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Media Sosial Card
                      Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Media Sosial',
                                    style: theme.textTheme.titleSmall?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.edit_outlined, size: 18),
                                    onPressed: () {},
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Media sosial akan ditampilkan di sini',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPortfolioTab(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Portfolio Terbaru',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Row(
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.filter_list, size: 16),
                    label: const Text('Tampilkan'),
                    style: TextButton.styleFrom(foregroundColor: Colors.black54),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add, size: 16),
                    label: const Text('Lihat Semua'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E56A0),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Portfolio Card (Empty State)
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 0,
            child: Container(
              height: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.work_outline, size: 48, color: Colors.grey.shade400),
                  const SizedBox(height: 12),
                  Text(
                    'Portfolio akan ditampilkan di sini',
                    style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSertifikatTab(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sertifikat Terbaru',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Row(
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.filter_list, size: 16),
                      label: const Text('Tampilkan'),
                      style: TextButton.styleFrom(foregroundColor: Colors.black54),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add, size: 16),
                      label: const Text('Lihat Semua'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E56A0),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Sertifikat Card
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 0,
              child: Container(
                height: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.emoji_events_outlined, size: 48, color: Colors.orange.shade400),
                    const SizedBox(height: 8),
                    Text(
                      'Sertifikat akan ditampilkan di sini',
                      style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Tombol Tambah Sertifikat
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E56A0),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text('Tambah Sertifikat'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDocumentItem({
    required String title,
    required String subtitle,
    required Color buttonColor,
    required String buttonText,
    required IconData icon,
    String? warningText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(icon, size: 16),
                label: Text(buttonText, style: const TextStyle(fontSize: 12)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  textStyle: const TextStyle(fontSize: 12),
                ),
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.download, size: 18),
              onPressed: () {},
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              style: IconButton.styleFrom(
                backgroundColor: Colors.grey.shade200,
              ),
            ),
          ],
        ),
        if (warningText != null) ...[
          const SizedBox(height: 6),
          Text(
            warningText,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.red,
            ),
          ),
        ],
      ],
    );
  }
}
