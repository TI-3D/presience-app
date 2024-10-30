import 'package:flutter/material.dart';
import 'package:presience_app/presentation/widgets/empty_state/container.dart';
import 'package:presience_app/presentation/widgets/empty_state/image.dart';

class EmptyHistoryPresensi extends StatelessWidget {
  const EmptyHistoryPresensi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: CustomContainerEmptyState(
            image: LargeEmptyStateImage(
                assetPath:
                    'assets/streamline/Page-Not-Found-2--Streamline-Barcelona.png'),
            title: 'Tidak Ada Riwayat Presensi',
            subtitle: 'Tunggu dosen kamu membuka presensi'),
      ),
    );
  }
}