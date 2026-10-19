import 'package:flutter/material.dart';

import '../responsive/responsive_layout.dart';
import 'custom_app_bar.dart';
import 'custom_drawer.dart';
import 'nav_item.dart';

class MainLayout extends StatelessWidget {
  final List<NavItem> items;
  final Widget body;

  const MainLayout({super.key, required this.items, required this.body});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

    return Scaffold(
      appBar: CustomAppBar(items: items),
      drawer: isDesktop ? null : CustomDrawer(items: items),
      body: body,
    );
  }
}
