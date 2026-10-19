import 'package:flutter/material.dart';

/// Gaya neo-brutalist ceria: latar krem, border tebal, bayangan keras,
/// blok pastel. Teks selalu memakai [ink] (rasio kontras >= 5:1 di semua blok).
class AppTheme {
  static const Color ink = Color(0xFF2D3748);
  static const Color inkSoft = Color(0xFF475569); // 7.3:1 di atas krem
  static const Color cream = Color(0xFFFFF9F5);
  static const Color surface = Colors.white;
  static const Color green = Color(0xFF22C55E); // aksen CTA
  static const Color blue = Color(0xFFADD8E6);
  static const Color salmon = Color(0xFFFDBCB4);
  static const Color lavender = Color(0xFFE6E6FA);
  static const Color mint = Color(0xFF98FF98);

  static const List<Color> pastels = [blue, salmon, lavender, mint];

  static const double border = 3;
  static const String heading = 'Fredoka';
  static const String body = 'DMSans';

  /// Kotak dengan border gelap dan bayangan keras.
  static BoxDecoration box({
    Color color = surface,
    double radius = 16,
    double shadow = 4,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: ink, width: border),
      boxShadow: shadow == 0
          ? null
          : [BoxShadow(color: ink, offset: Offset(shadow, shadow))],
    );
  }

  static TextStyle h(double size, {Color color = ink}) => TextStyle(
    fontFamily: heading,
    fontSize: size,
    fontWeight: FontWeight.w700,
    height: 1.15,
    color: color,
  );

  static ThemeData get lightTheme {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: body,
      scaffoldBackgroundColor: cream,
      colorScheme: const ColorScheme.light(
        primary: green,
        onPrimary: ink,
        surface: cream,
        onSurface: ink,
      ),
    );

    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: const BorderSide(color: ink, width: border),
    );
    const label = TextStyle(
      fontFamily: heading,
      fontWeight: FontWeight.w700,
      fontSize: 16,
    );

    return base.copyWith(
      textTheme: base.textTheme.apply(bodyColor: ink, displayColor: ink),
      appBarTheme: const AppBarTheme(
        backgroundColor: cream,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(color: ink),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: green,
          foregroundColor: ink,
          elevation: 0,
          shadowColor: ink,
          shape: shape,
          minimumSize: const Size(44, 52),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          textStyle: label,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: blue,
          foregroundColor: ink,
          shape: shape,
          side: const BorderSide(color: ink, width: border),
          minimumSize: const Size(44, 52),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          textStyle: label,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: ink),
      ),
      dividerColor: ink,
    );
  }
}
