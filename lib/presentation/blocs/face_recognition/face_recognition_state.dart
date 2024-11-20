part of 'face_recognition_bloc.dart';

@freezed
class FaceRecognitionState with _$FaceRecognitionState {
  const factory FaceRecognitionState.initial() = _Initial;
  const factory FaceRecognitionState.loading() = _Loading;
  const factory FaceRecognitionState.failure(String message) = _Failure;
  const factory FaceRecognitionState.success(String message) = _Success;
}
