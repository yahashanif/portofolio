import 'package:flutter/material.dart';

import '../responsive/responsive_layout.dart';
import '../theme/app_theme.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onScrollToProjects;
  final VoidCallback onScrollToAbout;

  const HeroSection({
    super.key,
    required this.onScrollToProjects,
    required this.onScrollToAbout,
  });

  @override
  Widget build(BuildContext context) {
    final compact = !ResponsiveLayout.isDesktop(context);

    final text = _buildText(compact);
    final avatar = _buildAvatar(compact);

    if (compact) {
      return Column(children: [avatar, const SizedBox(height: 48), text]);
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 6, child: text),
        const SizedBox(width: 48),
        Expanded(flex: 4, child: Center(child: avatar)),
      ],
    );
  }

  Widget _buildText(bool compact) {
    final align = compact
        ? CrossAxisAlignment.center
        : CrossAxisAlignment.start;
    final textAlign = compact ? TextAlign.center : TextAlign.left;

    return Column(
      crossAxisAlignment: align,
      children: [
        Text(
          'Flutter Developer',
          textAlign: textAlign,
          style: AppTheme.h(compact ? 44 : 68),
        ),
        const SizedBox(height: 24),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Text(
            'Saya membuat aplikasi mobile dan web dengan Flutter, '
            'terutama untuk rumah sakit dan klinik.',
            textAlign: textAlign,
            style: TextStyle(
              fontSize: compact ? 16 : 19,
              height: 1.6,
              color: AppTheme.inkSoft,
            ),
          ),
        ),
        const SizedBox(height: 36),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: compact ? WrapAlignment.center : WrapAlignment.start,
          children: [
            _HardButton(
              label: 'Lihat proyek saya',
              color: AppTheme.green,
              onTap: onScrollToProjects,
            ),
            _HardButton(
              label: 'Tentang saya',
              color: AppTheme.blue,
              onTap: onScrollToAbout,
            ),
          ],
        ),
      ],
    );
  }

  // Placeholder: ganti dengan foto asli (belum ada foto dari pemilik).
  Widget _buildAvatar(bool compact) {
    final size = compact ? 200.0 : 300.0;
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: AppTheme.box(color: AppTheme.salmon, radius: size, shadow: 8),
      child: Text('HA', style: AppTheme.h(size * 0.34)),
    );
  }
}

/// Tombol dengan border tebal dan bayangan keras; menekan = bergeser ke bayangan.
class _HardButton extends StatefulWidget {
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _HardButton({
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  State<_HardButton> createState() => _HardButtonState();
}

class _HardButtonState extends State<_HardButton> {
  bool _hover = false;
  bool _down = false;

  @override
  Widget build(BuildContext context) {
    final offset = _down ? 0.0 : (_hover ? 2.0 : 4.0);
    return FocusableActionDetector(
      mouseCursor: SystemMouseCursors.click,
      onShowHoverHighlight: (v) => setState(() => _hover = v),
      onShowFocusHighlight: (v) => setState(() => _hover = v),
      actions: {
        ActivateIntent: CallbackAction<ActivateIntent>(
          onInvoke: (_) {
            widget.onTap();
            return null;
          },
        ),
      },
      child: GestureDetector(
        onTapDown: (_) => setState(() => _down = true),
        onTapCancel: () => setState(() => _down = false),
        onTapUp: (_) => setState(() => _down = false),
        onTap: widget.onTap,
        child: Semantics(
          button: true,
          label: widget.label,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 120),
            constraints: const BoxConstraints(minHeight: 52, minWidth: 44),
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            transform: Matrix4.translationValues(4 - offset, 4 - offset, 0),
            decoration: AppTheme.box(color: widget.color, shadow: offset),
            child: Text(widget.label, style: AppTheme.h(17)),
          ),
        ),
      ),
    );
  }
}
