import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String? userAvatarUrl;
  final VoidCallback? onHomePressed;
  final String? kelas;

  const MyAppBar({
    Key? key,
    this.userName = 'Nama Pengguna',
    this.userAvatarUrl,
    this.onHomePressed,
    this.kelas,
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
          CircleAvatar(
            radius: 18,
            backgroundImage: userAvatarUrl != null
                ? NetworkImage(userAvatarUrl!) as ImageProvider
                : const NetworkImage('https://picsum.photos/seed/profile/200'),
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
        color: const Color(0xFFEAF4FF),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            const Icon(Icons.copyright, color: Color(0xFF1E88E5)),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                child ?? '© GEN-28 PPLG SMK Wikrama Bogor. All Rights Reserved.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

