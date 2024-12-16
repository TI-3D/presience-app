import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presience_app/data/datasources/local_datasources/auth_local_datasources.dart';
import 'package:presience_app/data/datasources/remote_datasources/face_recognition_remote_datasource.dart';

import '../../../data/dto/requests/auth_dto.dart';
import '../../../domain/entities/user.dart';

part 'face_recognition_bloc.freezed.dart';
part 'face_recognition_event.dart';
part 'face_recognition_state.dart';

class FaceRecognitionBloc
    extends Bloc<FaceRecognitionEvent, FaceRecognitionState> {
  final FaceRecognitionRemoteDatasource _faceRecognitionRemoteDatasource;
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  FaceRecognitionBloc(
    this._faceRecognitionRemoteDatasource,
  ) : super(const _Initial()) {
    on<_StoreFace>((event, emit) async {
      emit(const _Loading());

      AuthDto? user = await AuthLocalDataSource().getAuthData();

      final response =
          await _faceRecognitionRemoteDatasource.storeFace(event.params);
      await response.fold(
        (l) async => emit(_Failure(l)),
        (r) async {
          User updatedUser = user!.user!.copyWith(isVerified: true);
          user = user!.copyWith(user: updatedUser);

          // Pastikan operasi ini di `await`
          await secureStorage.write(
            key: 'auth_data',
            value: jsonEncode(user?.toJson()),
          );
          emit(_Success(r));
        },
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
