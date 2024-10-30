import 'package:flutter/material.dart';
import 'package:presience_app/presentation/widgets/empty_state/container.dart';
import 'package:presience_app/presentation/widgets/empty_state/image.dart';

class EmptyPresensi extends StatelessWidget {
  const EmptyPresensi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomContainerEmptyState(
            image: SmallEmptyStateImage(
              assetPath:
                  'assets/streamline/Being-Happy-2--Streamline-Barcelona.png',
            ),
            title: 'Tidak ada Presensi',
            subtitle:
                'Kami akan memberimu notifikasi jika ada presensi aktif',
            width: 300,
          ),
        ],
      ),
    );
  }
}