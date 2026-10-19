# DESIGN

Gaya mengacu ke demo `uupm.cc/demo/educational-platform` (neo-brutalist ceria), dipakai untuk portofolio ini. Konten demo (statistik, testimoni) tidak diambil.

## Arah
- Portofolio Flutter Developer, web saja. Tema terang krem, border tebal, bayangan keras, blok pastel.
- Dial: ENERGY 2 / RHYTHM 2 / MOTION 1 (hanya transisi hover/tekan).
- Identity motif: kotak ber-border 3px dengan bayangan keras 4-6px.

## Token (sumber: `lib/theme/app_theme.dart`)
- Latar krem `#FFF9F5`; teks `#2D3748`; teks sekunder `#475569`.
- Aksen CTA hijau `#22C55E` (teks hitam-abu di atasnya, kontras 5,3:1).
- Pastel pendukung: biru `#ADD8E6`, salmon `#FDBCB4`, lavender `#E6E6FA`, mint `#98FF98`.
- Font: Fredoka (judul), DM Sans (isi), dibundel di `assets/fonts` (lisensi OFL).
- Radius 16-24; border 3px (chip 2px).

## Aturan
- Teks di atas blok berwarna selalu memakai warna ink, bukan putih (putih hanya 1,2-2,3:1 di atas pastel/hijau).
- Area tap minimal 44x44; fokus keyboard terlihat; kartu dan tombol bisa dioperasikan dengan Enter/Space.
- Tidak ada angka atau klaim tanpa sumber. Foto profil masih placeholder (inisial).
