import 'package:flutter/material.dart';

import '../responsive/responsive_layout.dart';
import '../theme/app_theme.dart';
import 'nav_item.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<NavItem> items;

  const CustomAppBar({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.cream,
        border: Border(
          bottom: BorderSide(color: AppTheme.ink, width: AppTheme.border),
        ),
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        titleSpacing: isDesktop ? 32 : 0,
        title: InkWell(
          onTap: items.isNotEmpty ? items.first.onTap : null,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Text('Hanif A S', style: AppTheme.h(24)),
          ),
        ),
        actions: isDesktop
            ? [
                for (final item in items)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: TextButton(
                      onPressed: item.onTap,
                      style: TextButton.styleFrom(
                        foregroundColor: AppTheme.inkSoft,
                        minimumSize: const Size(44, 44),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        textStyle: const TextStyle(
                          fontFamily: AppTheme.body,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      child: Text(item.label),
                    ),
                  ),
                const SizedBox(width: 32),
              ]
            : null,
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + AppTheme.border);
}
