import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presience_app/domain/entities/course.dart';
import 'package:presience_app/domain/entities/group.dart';
import 'package:presience_app/domain/entities/lecturer.dart';
import 'package:presience_app/domain/entities/room.dart';
import 'package:presience_app/domain/entities/week.dart';

part 'schedule.freezed.dart';
part 'schedule.g.dart';

@freezed
class Schedule with _$Schedule {
  const factory Schedule({
    int? id,
    String? day,
    String? startTime,
    String? endTime,
    Week? week,
    Lecturer? lecturer,
    Group? group,
    Room? room,
    Course? course,
  }) = _Schedule;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        id: json['id'],
        day: json['day'],
        startTime: json['start_time'],
        endTime: json['end_time'],
        week: json['week'] != null ? Week.fromJson(json['week']) : null,
        lecturer: Lecturer.fromJson(json['lecturer']),
        group: json['group'] != null ? Group.fromJson(json['group']) : null,
        room: Room.fromJson(json['room']),
        course: Course.fromJson(json['course']),
      );
}
