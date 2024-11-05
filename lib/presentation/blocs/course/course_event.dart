part of 'course_bloc.dart';

@freezed
class CourseEvent with _$CourseEvent {
  const factory CourseEvent.started() = _Started;
  const factory CourseEvent.getCourses() = _GetCourses;
}
