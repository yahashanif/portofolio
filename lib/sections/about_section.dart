import 'package:flutter/material.dart';

import '../responsive/responsive_layout.dart';
import '../theme/app_theme.dart';
import '../widgets/section_title.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  static const _skills = [
    'Flutter',
    'Dart',
    'BLoC',
    'Firebase',
    'REST API',
    'Google Maps API',
    'Payment Gateway',
  ];

  @override
  Widget build(BuildContext context) {
    final compact = ResponsiveLayout.isMobile(context);

    return Column(
      children: [
        const SectionTitle(title: 'Tentang Saya'),
        const SizedBox(height: 40),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(compact ? 24 : 40),
          decoration: AppTheme.box(
            color: AppTheme.lavender,
            radius: 24,
            shadow: 6,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Saya mengembangkan aplikasi untuk sektor kesehatan, mulai dari aplikasi pasien '
                'yang sudah rilis di Google Play Store dan Apple App Store, sampai sistem informasi '
                'rumah sakit dan klinik.',
                style: TextStyle(
                  color: AppTheme.ink,
                  fontSize: 17,
                  height: 1.7,
                ),
              ),
              const SizedBox(height: 28),
              Text('Teknologi', style: AppTheme.h(22)),
              const SizedBox(height: 14),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  for (var i = 0; i < _skills.length; i++)
                    _Chip(
                      label: _skills[i],
                      color: AppTheme.pastels[i % AppTheme.pastels.length],
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  final Color color;

  const _Chip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: AppTheme.box(
        color: color,
        radius: 20,
        shadow: 0,
      ).copyWith(border: Border.all(color: AppTheme.ink, width: 2)),
      child: Text(
        label,
        style: const TextStyle(
          color: AppTheme.ink,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
