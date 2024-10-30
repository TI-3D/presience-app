import 'package:flutter/material.dart';
import 'package:presience_app/presentation/widgets/empty_state/container.dart';
import 'package:presience_app/presentation/widgets/empty_state/image.dart';

class EmptyHistoryPresensi2 extends StatelessWidget {
  const EmptyHistoryPresensi2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          MediaQuery.of(context).size.height, // Mengambil tinggi layar penuh
      padding: const EdgeInsets.symmetric(horizontal: 16),
      // width: MediaQuery.of(context).size.width,
      child: Center(
        child: CustomContainerEmptyState(
          image: LargeEmptyStateImage(
            assetPath:
                'assets/streamline/Page-Not-Found-2--Streamline-Barcelona.png',
          ),
          title: 'Tidak Ada Presensi',
          subtitle: 'Tunggu dosen kamu membuka presensi',
        ),
      ),
    );
  }
}
