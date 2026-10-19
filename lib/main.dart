import 'package:flutter/material.dart';

import 'sections/about_section.dart';
import 'sections/hero_section.dart';
import 'sections/projects_section.dart';
import 'theme/app_theme.dart';
import 'widgets/main_layout.dart';
import 'widgets/nav_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hanif A S | Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _scrollController = ScrollController();
  final _homeKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _projectsKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = [
      NavItem(
        label: 'Home',
        icon: Icons.home_outlined,
        onTap: () => _scrollTo(_homeKey),
      ),
      NavItem(
        label: 'Tentang',
        icon: Icons.person_outline,
        onTap: () => _scrollTo(_aboutKey),
      ),
      NavItem(
        label: 'Karya',
        icon: Icons.work_outline,
        onTap: () => _scrollTo(_projectsKey),
      ),
    ];

    return MainLayout(
      items: items,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      const SizedBox(height: 72),
                      HeroSection(
                        key: _homeKey,
                        onScrollToProjects: () => _scrollTo(_projectsKey),
                        onScrollToAbout: () => _scrollTo(_aboutKey),
                      ),
                      const SizedBox(height: 120),
                      AboutSection(key: _aboutKey),
                      const SizedBox(height: 100),
                      ProjectsSection(key: _projectsKey),
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
            ),
            const _Footer(),
          ],
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 28),
      decoration: const BoxDecoration(
        color: AppTheme.blue,
        border: Border(
          top: BorderSide(color: AppTheme.ink, width: AppTheme.border),
        ),
      ),
      child: const Text(
        '\u00a9 2026 Hanif A S. Dibuat dengan Flutter.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppTheme.ink,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
