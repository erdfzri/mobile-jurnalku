import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String? userAvatarUrl;
  final VoidCallback? onHomePressed;
  final String? kelas;
  final void Function(String)? onMenuSelected; // new optional callback

  const MyAppBar({
    Key? key,
    this.userName = 'Nama Pengguna',
    this.userAvatarUrl,
    this.onHomePressed,
    this.kelas,
    this.onMenuSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      leading: IconButton(
        icon: const Icon(Icons.home_outlined, color: Colors.black87),
        onPressed: onHomePressed ?? () {
          Navigator.of(context).popUntil((route) => route.isFirst);
        },
      ),
      title: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: kToolbarHeight,
              child: Align(
                alignment: Alignment.centerRight,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      userName,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.black87,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    if (kelas != null && kelas!.isNotEmpty)
                      Text(
                        kelas!,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Popup menu wrapped on avatar
          PopupMenuButton<String>(
            // pastikan menu muncul di bawah avatar, tidak menutupi
            offset: const Offset(0, 40),
            tooltip: 'Menu profil',
            onSelected: (value) {
              if (onMenuSelected != null) {
                onMenuSelected!(value);
                return;
              }
              // default behavior: show SnackBar
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Pilih: $value')),
              );
            },
            itemBuilder: (context) => <PopupMenuEntry<String>>[
              // top group
              PopupMenuItem<String>(
                value: 'Dashboard',
                child: ListTile(
                  leading: const Icon(Icons.dashboard_outlined),
                  title: const Text('Dashboard'),
                ),
              ),
              PopupMenuItem<String>(
                value: 'Profil',
                child: ListTile(
                  leading: const Icon(Icons.person_outline),
                  title: const Text('Profil'),
                ),
              ),
              PopupMenuItem<String>(
                value: 'Jelajahi',
                child: ListTile(
                  leading: const Icon(Icons.explore_outlined),
                  title: const Text('Jelajahi'),
                ),
              ),
              const PopupMenuDivider(),
              // second group
              PopupMenuItem<String>(
                value: 'Jurnal Pembiasaan',
                child: ListTile(
                  leading: const Icon(Icons.menu_book_outlined),
                  title: const Text('Jurnal Pembiasaan'),
                ),
              ),
              PopupMenuItem<String>(
                value: 'Permintaan Saksi',
                child: ListTile(
                  leading: const Icon(Icons.person_search_outlined),
                  title: const Text('Permintaan Saksi'),
                ),
              ),
              PopupMenuItem<String>(
                value: 'Progress',
                child: ListTile(
                  leading: const Icon(Icons.show_chart),
                  title: const Text('Progress'),
                ),
              ),
              PopupMenuItem<String>(
                value: 'Catatan Sikap',
                child: ListTile(
                  leading: const Icon(Icons.warning_amber_outlined),
                  title: const Text('Catatan Sikap'),
                ),
              ),
              const PopupMenuDivider(),
              // bottom group
              PopupMenuItem<String>(
                value: 'Panduan Penggunaan',
                child: ListTile(
                  leading: const Icon(Icons.menu_book),
                  title: const Text('Panduan Penggunaan'),
                ),
              ),
              PopupMenuItem<String>(
                value: 'Pengaturan Akun',
                child: ListTile(
                  leading: const Icon(Icons.settings_outlined),
                  title: const Text('Pengaturan Akun'),
                ),
              ),
              PopupMenuItem<String>(
                value: 'Log Out',
                child: ListTile(
                  leading: const Icon(Icons.logout_outlined),
                  title: const Text('Log Out'),
                ),
              ),
            ],
            child: CircleAvatar(
              radius: 18,
              backgroundImage: userAvatarUrl != null
                  ? NetworkImage(userAvatarUrl!) as ImageProvider
                  : const NetworkImage('https://picsum.photos/seed/profile/200'),
            ),
          ),
        ],
      ),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class MyFooter extends StatelessWidget {
  final String? child;

  const MyFooter({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      child: Container(
        width: double.infinity,
        color: Colors.indigo.shade800,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                child ?? '© GEN-28 PPLG SMK Wikrama Bogor. All Rights Reserved.',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 12,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check_circle, color: Colors.white.withOpacity(0.9), size: 14),
                const SizedBox(width: 6),
                Text(
                  'Validated schema',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 12,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

