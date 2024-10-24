import 'package:flutter/material.dart';
import 'package:presience_app/data/dto/requests/auth_dto.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/cards/card.dart';


class AttendanceCard extends StatelessWidget {
  final AuthDto data;
  const AttendanceCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "D4 ${data.user!.major!} - Semester ${data.user!.semester!}",
                style: mediumBodyTextL,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    "90%",
                    style: mediumBodyTextXL.copyWith(
                        fontSize: 40,
                        letterSpacing: calculateWordSpacing(40),
                        color: greenTheme),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Kehadiran",
                    style: regularBodyTextS.copyWith(color: greenTheme),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              height: 72,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    height: double.infinity,
                    color: neutralTheme[50],
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "4",
                            style: heading2,
                          ),
                          Text(
                            "Sakit",
                            style: mediumBodyTextS.copyWith(
                                color: neutralTheme[300]),
                          ),
                        ],
                      ),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    height: double.infinity,
                    color: neutralTheme[50],
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "4",
                            style: heading2,
                          ),
                          Text(
                            "Izin",
                            style: mediumBodyTextS.copyWith(
                                color: neutralTheme[300]),
                          ),
                        ],
                      ),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    height: double.infinity,
                    color: neutralTheme[50],
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "4",
                            style: heading2,
                          ),
                          Text(
                            "Alpha",
                            style: mediumBodyTextS.copyWith(
                                color: neutralTheme[300]),
                          ),
                        ],
                      ),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                      color: redTheme[100]!,
                      border: Border(
                          left: BorderSide(color: redTheme[200]!, width: 1)),
                    ),
                    height: double.infinity,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "4",
                            style: heading2.copyWith(color: redTheme),
                          ),
                          Text(
                            "Kompen",
                            style:
                                mediumBodyTextS.copyWith(color: redTheme[400]!),
                          ),
                        ],
                      ),
                    ),
                  )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}