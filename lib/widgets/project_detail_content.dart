import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class ProjectDetailContent extends StatelessWidget {
  final String title;
  final String fullDescription;
  final String? mainImagePath;
  final List<String> techStack;
  final List<String> galleryImages;

  const ProjectDetailContent({
    super.key,
    required this.title,
    required this.fullDescription,
    this.mainImagePath,
    required this.techStack,
    this.galleryImages = const [],
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width < 700 ? double.maxFinite : 800,
      constraints: BoxConstraints(maxHeight: size.height * 0.9),
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: Text(title, style: AppTheme.h(32))),
                IconButton(
                  tooltip: 'Tutup',
                  icon: const Icon(Icons.close, color: AppTheme.ink, size: 28),
                  style: IconButton.styleFrom(
                    minimumSize: const Size(44, 44),
                    backgroundColor: AppTheme.salmon,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(color: AppTheme.ink, width: 2),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (mainImagePath != null)
              Container(
                height: 350,
                width: double.infinity,
                decoration: AppTheme.box(shadow: 0),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  mainImagePath!,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  errorBuilder: (_, _, _) =>
                      const Center(child: Text('Gambar tidak dapat dimuat')),
                ),
              ),
            const SizedBox(height: 32),
            Text('Latar Belakang & Detail Proyek', style: AppTheme.h(24)),
            const SizedBox(height: 12),
            Text(
              fullDescription,
              style: const TextStyle(
                color: AppTheme.ink,
                fontSize: 16,
                height: 1.8,
              ),
            ),
            const SizedBox(height: 36),
            if (galleryImages.isNotEmpty) ...[
              Text('Galeri Aplikasi', style: AppTheme.h(24)),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: galleryImages.map(_photo).toList()),
              ),
              const SizedBox(height: 36),
            ],
            Text('Stack Teknologi', style: AppTheme.h(24)),
            const SizedBox(height: 14),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (var i = 0; i < techStack.length; i++)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration:
                        AppTheme.box(
                          color: AppTheme.pastels[i % AppTheme.pastels.length],
                          radius: 20,
                          shadow: 0,
                        ).copyWith(
                          border: Border.all(color: AppTheme.ink, width: 2),
                        ),
                    child: Text(
                      techStack[i],
                      style: const TextStyle(
                        color: AppTheme.ink,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _photo(String imagePath) {
    return Semantics(
      image: true,
      label: 'Screenshot aplikasi',
      child: Container(
        margin: const EdgeInsets.only(right: 20, bottom: 6),
        width: 250,
        height: 500,
        decoration: AppTheme.box(shadow: 0),
        clipBehavior: Clip.antiAlias,
        child: Image.asset(imagePath, fit: BoxFit.cover),
      ),
    );
  }
}
