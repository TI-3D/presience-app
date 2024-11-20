part of 'face_recognition_bloc.dart';

@freezed
class FaceRecognitionEvent with _$FaceRecognitionEvent {
  const factory FaceRecognitionEvent.started() = _Started;
  const factory FaceRecognitionEvent.storeFace(File params) = _StoreFace;
  const factory FaceRecognitionEvent.validateFace(File params) = _ValidateFace;
  const factory FaceRecognitionEvent.validatePassword(String password) =
      _ValidatePassword;
}
