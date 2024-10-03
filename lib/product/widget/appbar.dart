import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final bool showBackButton;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.onBackPressed,
    this.showBackButton =
        true, // Varsayılan olarak geri butonu gösterilecek false yaparsam gelmeyecek
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: onBackPressed,
            )
          : null, // Geri butonunu gösterme seçeneği
      centerTitle: true,
      backgroundColor: Colors.transparent,
      title: Text(
        title,
        style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
