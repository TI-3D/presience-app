import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presience_app/domain/entities/permit.dart';
import 'package:presience_app/domain/entities/schedule_week.dart';

part 'permit_detail.freezed.dart';
part 'permit_detail.g.dart';

@freezed
class PermitDetail with _$PermitDetail {
  const factory PermitDetail({
    int? id,
    String? status,
    Permit? permit,
    ScheduleWeek? scheduleWeek,
    DateTime? createdAt,
  }) = _PermitDetail;

  factory PermitDetail.fromJson(Map<String, dynamic> json) => PermitDetail(
        id: json['id'],
        status: json['status'],
        permit: json['permit'] != null ? Permit.fromJson(json['permit']) : null,
        scheduleWeek: json['schedule_week'] != null
            ? ScheduleWeek.fromJson(json['schedule_week'])
            : null,
        createdAt: DateTime.parse(json['created_at']),
      );
}
