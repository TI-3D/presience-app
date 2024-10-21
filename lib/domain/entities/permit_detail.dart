import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presience_app/domain/entities/permit.dart';
import 'package:presience_app/domain/entities/schedule_week.dart';

part 'permit_detail.freezed.dart';
part 'permit_detail.g.dart';

@freezed
class PermitDetail with _$PermitDetail {
  const factory PermitDetail({
    int? id,
    String? typePermission,
    String? status,
    Permit? permit,
    ScheduleWeek? scheduleWeek,
  }) = _PermitDetail;

  factory PermitDetail.fromJson(Map<String, dynamic> json) => PermitDetail(
        id: json['id'],
        typePermission: json['type_permission'],
        status: json['status'],
        permit: Permit.fromJson(json['permit']),
        scheduleWeek: ScheduleWeek.fromJson(json['schedule_week']),
      );
}
