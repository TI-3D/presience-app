import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presience_app/data/datasources/remote_datasources/course_remote_datasource.dart';
import 'package:presience_app/domain/entities/course.dart';

part 'course_bloc.freezed.dart';
part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseRemoteDatasource _courseRemoteDatasource;
  CourseBloc(
    this._courseRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetCourses>((event, emit) async {
      emit(const _Loading());
      final response = await _courseRemoteDatasource.getCourses();
      response.fold(
        (l) => emit(_Failure(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
