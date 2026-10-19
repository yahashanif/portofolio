import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'nav_item.dart';

class CustomDrawer extends StatelessWidget {
  final List<NavItem> items;

  const CustomDrawer({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppTheme.cream,
      shape: const Border(
        right: BorderSide(color: AppTheme.ink, width: AppTheme.border),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(28, 28, 28, 24),
              decoration: const BoxDecoration(
                color: AppTheme.blue,
                border: Border(
                  bottom: BorderSide(
                    color: AppTheme.ink,
                    width: AppTheme.border,
                  ),
                ),
              ),
              child: Text('Hanif A S', style: AppTheme.h(28)),
            ),
            const SizedBox(height: 12),
            for (final item in items)
              ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 4,
                ),
                leading: Icon(item.icon, color: AppTheme.ink),
                title: Text(
                  item.label,
                  style: const TextStyle(
                    color: AppTheme.ink,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                hoverColor: AppTheme.lavender,
                onTap: () {
                  Navigator.pop(context);
                  item.onTap();
                },
              ),
          ],
        ),
      ),
    );
  }
}
