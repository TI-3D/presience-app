import 'package:flutter/material.dart';
import 'package:presience_app/data/dto/requests/auth_dto.dart';
import 'package:presience_app/domain/entities/attendance_information.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/cards/card.dart';

class AttendanceCard extends StatelessWidget {
  final AuthDto data;
  final AttendanceInformation attendanceInformation;

  const AttendanceCard({
    super.key,
    required this.data,
    required this.attendanceInformation,
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
              AttendancePercentage(
                attendancePercentage:
                    attendanceInformation.percentageAttendance!,
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
                            attendanceInformation.sakit.toString(),
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
                            attendanceInformation.izin.toString(),
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
                            attendanceInformation.alpha.toString(),
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
                            attendanceInformation.kompen.toString(),
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

class AttendancePercentage extends StatelessWidget {
  final int attendancePercentage;
  const AttendancePercentage({
    super.key,
    required this.attendancePercentage,
  });

  @override
  Widget build(BuildContext context) {
    Color? color;
    if (attendancePercentage >= 80) {
      color = greenTheme;
    } else if (attendancePercentage >= 75) {
      color = orangeTheme;
    } else {
      color = redTheme;
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          "$attendancePercentage%",
          style: mediumBodyTextXL.copyWith(
              fontSize: 40,
              letterSpacing: calculateWordSpacing(40),
              color: color),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          "Kehadiran",
          style: regularBodyTextS.copyWith(color: color),
        ),
      ],
    );
  }
}
