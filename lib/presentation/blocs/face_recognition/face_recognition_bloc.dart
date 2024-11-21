import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presience_app/data/datasources/remote_datasources/face_recognition_remote_datasource.dart';

part 'face_recognition_bloc.freezed.dart';
part 'face_recognition_event.dart';
part 'face_recognition_state.dart';

class FaceRecognitionBloc
    extends Bloc<FaceRecognitionEvent, FaceRecognitionState> {
  final FaceRecognitionRemoteDatasource _faceRecognitionRemoteDatasource;
  FaceRecognitionBloc(
    this._faceRecognitionRemoteDatasource,
  ) : super(const _Initial()) {
    on<_StoreFace>((event, emit) async {
      emit(const _Loading());
      final response =
          await _faceRecognitionRemoteDatasource.storeFace(event.params);
      response.fold(
        (l) => emit(_Failure(l)),
        (r) => emit(_Success(r)),
      );
    });

    on<_ValidateFace>((event, emit) async {
      emit(const _Loading());
      final response =
          await _faceRecognitionRemoteDatasource.validateFace(event.params);
      response.fold(
        (l) => emit(_Failure(l)),
        (r) => emit(_Success(r)),
      );
    });

    on<_ValidatePassword>((event, emit) async {
      emit(const _Loading());
      final response = await _faceRecognitionRemoteDatasource
          .validatePassword(event.password);
      response.fold(
        (l) => emit(_Failure(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
