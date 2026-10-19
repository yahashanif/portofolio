import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/project_detail_content.dart';
import '../widgets/section_title.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        children: [
          const SectionTitle(title: 'Karya Saya'),
          const SizedBox(height: 40),
          Wrap(
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: [
              // Project 1 (Gambar asli yang Anda kirim)
              _buildProjectCard(
                context,
                title: 'Primaya Hospital App',
                description: 'Aplikasi layanan kesehatan komprehensif untuk memudahkan akses pasien ke fasilitas rumah sakit.',
                imagePath: 'assets/images/project1.png',
                fullDescription: 'Aplikasi layanan kesehatan khusus untuk Primaya Hospital. Melalui aplikasi ini, pasien bisa dengan mudah membuat janji dengan dokter, melakukan telekonsultasi, melihat rekam medis, mencari cabang rumah sakit terdekat, mengecek jadwal dokter secara real-time, melihat jadwal pribadi, hingga melakukan reschedule.\n\nSalah satu fitur unggulannya adalah sistem pembayaran terintegrasi tanpa antre, memungkinkan pasien membayar langsung melalui aplikasi tanpa perlu ke kasir.\n\nAplikasi ini saya kembangkan menggunakan Flutter dan telah berhasil dirilis secara resmi di Google Play Store maupun Apple App Store. Untuk sisi backend, saya berkolaborasi secara intensif bersama tim developer.',
                techStack: [
                  'Flutter',
                  'Dart',
                  'BLoC',
                  'HTTP',
                  'Firebase',
                  'Google Maps API',
                  'Duitku Payment Gateway',
                ],
                galleryImages: [
                  'assets/images/primaya_ss1.png',
                  'assets/images/primaya_ss2.png',
                  'assets/images/primaya_ss3.png',
                  'assets/images/primaya_ss4.png',
                  'assets/images/primaya_ss5.png',
                ],
              ),

              // Project 2 (Halo Awal Bros)
              _buildProjectCard(
                context,
                title: 'Halo Awal Bros',
                description: 'Aplikasi layanan kesehatan tepercaya untuk konsultasi dokter dan janji temu secara online.',
                imagePath: 'assets/images/project2.png',
              ),

              // Project 3 (Link Sehat)
              _buildProjectCard(
                context,
                title: 'Link Sehat',
                description: 'Aplikasi telekonsultasi kesehatan yang menghubungkan pasien langsung dengan dokter profesional.',
                imagePath: 'assets/images/project3.png',
              ),

              // Project 4 (HIS v3 Primaya)
              _buildProjectCard(
                context,
                title: 'HIS v3 Primaya',
                description: 'Hospital Information System (Sistem Informasi Rumah Sakit) versi 3 untuk manajemen operasional Primaya Hospital.',
                imagePath: 'assets/images/project4.png',
              ),

              // Project 5 (Melawai Eye Care)
              _buildProjectCard(
                context,
                title: 'Melawai Eye Care',
                description: 'Sistem operasional terpadu yang dikembangkan khusus untuk mengelola layanan di klinik mata Melawai.',
                imagePath: 'assets/images/project5.png',
              ),

              // Project 6 (Medens Medical Centre)
              _buildProjectCard(
                context,
                title: 'Medens Medical Centre',
                description: 'Aplikasi layanan kesehatan untuk klinik Medens (Medical Center) yang mempermudah akses layanan medis.',
                imagePath: 'assets/images/project6.png',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(
    BuildContext context, {
    required String title,
    required String description,
    String? imagePath,
    String? fullDescription,
    List<String>? techStack,
    List<String>? galleryImages,
  }) {
    void open() => _showProjectDetail(
      context,
      title,
      fullDescription ?? description,
      imagePath,
      techStack ?? ['Flutter', 'Dart'],
      galleryImages ?? [],
    );
    final tint =
        AppTheme.pastels[title.codeUnits.fold<int>(0, (a, b) => a + b) %
            AppTheme.pastels.length];

    return _HoverCard(
      label: 'Proyek $title, buka detail',
      onTap: open,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: tint,
                border: const Border(
                  bottom: BorderSide(
                    color: AppTheme.ink,
                    width: AppTheme.border,
                  ),
                ),
              ),
              child: imagePath != null
                  ? Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      errorBuilder: (_, _, _) => const Center(
                        child: Text('Gambar tidak dapat dimuat'),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTheme.h(22),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(
                      color: AppTheme.inkSoft,
                      fontSize: 14,
                      height: 1.5,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text('Lihat detail', style: AppTheme.h(16)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showProjectDetail(
    BuildContext context,
    String title,
    String fullDescription,
    String? imagePath,
    List<String> techStack,
    List<String> galleryImages,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: AppTheme.cream,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: AppTheme.ink, width: AppTheme.border),
          ),
          clipBehavior: Clip.antiAlias,
          child: ProjectDetailContent(
            title: title,
            fullDescription: fullDescription,
            mainImagePath: imagePath,
            techStack: techStack,
            galleryImages: galleryImages,
          ),
        );
      },
    );
  }
}

class _HoverCard extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  final String label;

  const _HoverCard({
    required this.child,
    required this.onTap,
    required this.label,
  });

  @override
  State<_HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<_HoverCard> {
  bool _active = false;

  @override
  Widget build(BuildContext context) {
    final lift = _active ? 6.0 : 0.0;
    return Semantics(
      button: true,
      label: widget.label,
      child: FocusableActionDetector(
        mouseCursor: SystemMouseCursors.click,
        onShowHoverHighlight: (v) => setState(() => _active = v),
        onShowFocusHighlight: (v) => setState(() => _active = v),
        actions: {
          ActivateIntent: CallbackAction<ActivateIntent>(
            onInvoke: (_) {
              widget.onTap();
              return null;
            },
          ),
        },
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeOut,
            width: 320,
            height: 430,
            transform: Matrix4.translationValues(-lift / 2, -lift / 2, 0),
            decoration: AppTheme.box(radius: 20, shadow: 6 + lift / 2),
            clipBehavior: Clip.antiAlias,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
