import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, textAlign: TextAlign.center, style: AppTheme.h(40)),
        const SizedBox(height: 12),
        Container(
          width: 72,
          height: 10,
          decoration: AppTheme.box(
            color: AppTheme.green,
            radius: 6,
            shadow: 0,
          ).copyWith(border: Border.all(color: AppTheme.ink, width: 2)),
        ),
      ],
    );
  }
}
