import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';

class CustomImageInputEmpty extends StatelessWidget {
  final String? errorMessage;

  const CustomImageInputEmpty({
    super.key,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DottedBorder(
            borderType: BorderType.RRect, // Membuat sudut membulat
            radius: const Radius.circular(8), // Radius sudut sesuai kebutuhan
            dashPattern: const [8, 8], // Mengatur pola garis putus-putus
            color: neutralTheme[200]!, // Warna border
            strokeWidth: 1, // Ketebalan garis border
            child: SizedBox(
              width: double.infinity,
              height: 192,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    TablerIcons.photo_up,
                    size: 48,
                    color: purpleTheme[950],
                  ),
                  Text(
                    'Unggah Gambar',
                    style: mediumBodyText.copyWith(
                      color: purpleTheme[950],
                    ),
                  ),
                  Text(
                    'Ukuran gambar maksimal 2MB',
                    style: mediumBodyTextS.copyWith(
                      color: neutralTheme[300],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (errorMessage != null)
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                errorMessage!,
                style: mediumBodyTextS.copyWith(color: redTheme),
              ),
            ),
        ],
      ),
    );
  }
}

class CustomImageInputFill extends StatelessWidget {
  const CustomImageInputFill({
    super.key,
    required this.imageProvider,
    required this.pathImage,
  });

  final ImageProvider<Object> imageProvider;
  final String? pathImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            height:
                192, // Tambahkan tinggi container agar cukup ruang untuk teks di bawah
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: neutralTheme[100],
            ),
            // Column untuk menempatkan gambar dan teks secara vertikal
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container untuk gambar
                Container(
                  height: 124, // Batasi tinggi gambar
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Path Image
                      Expanded(
                        child: Text(
                          pathImage!,
                          style: regularBodyTextS.copyWith(
                            color: neutralTheme[300],
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Ubah',
                        style: mediumBodyTextS.copyWith(
                          color: neutralTheme[400],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
