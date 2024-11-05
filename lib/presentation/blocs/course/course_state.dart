part of 'course_bloc.dart';

@freezed
class CourseState with _$CourseState {
  const factory CourseState.initial() = _Initial;
  const factory CourseState.loading() = _Loading;
  const factory CourseState.failure(String message) = _Failure;
  const factory CourseState.success(List<Course> data) = _Success;
}
