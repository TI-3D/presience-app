import 'package:flutter/material.dart';
import 'package:presience_app/presentation/widgets/empty_state/container.dart';
import 'package:presience_app/presentation/widgets/empty_state/image.dart';

import '../../../pages/presensi/perizinan.dart';
import '../../../utils/theme.dart';

class EmptyAjukanIzin extends StatelessWidget {
  const EmptyAjukanIzin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomContainerEmptyState(
            image: const LargeEmptyStateImage(
                assetPath:
                    'assets/streamline/Finding-1--Streamline-Barcelona.png'),
            title: 'Tidak Ada Pengajuan',
            subtitle:
                'Daripada alpha, mending sekarang kamu ajukan izin terlebih dahulu.',
            isButtonVisible: true,
            label: 'Ajukan Izin',
            width: MediaQuery.of(context).size.width * 0.8,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: modalBackground,
                builder: (BuildContext context) {
                  return const FormDate();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
