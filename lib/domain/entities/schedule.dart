import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presience_app/domain/entities/course.dart';
import 'package:presience_app/domain/entities/group.dart';
import 'package:presience_app/domain/entities/lecturer.dart';
import 'package:presience_app/domain/entities/room.dart';

part 'schedule.freezed.dart';
part 'schedule.g.dart';

@freezed
class Schedule with _$Schedule {
  const factory Schedule({
    int? id,
    String? day,
    String? startTime,
    String? endTime,
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
        lecturer: Lecturer.fromJson(json['lecturer']),
        group: Group.fromJson(json['group']),
        room: Room.fromJson(json['room']),
        course: Course.fromJson(json['course']),
      );
}
