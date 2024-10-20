import 'package:freezed_annotation/freezed_annotation.dart';

part 'lecturer.freezed.dart';
part 'lecturer.g.dart';

@freezed
class Lecturer with _$Lecturer {
  const factory Lecturer({
    int? id,
    String? nip,
    String? name,
    String? photo,
  }) = _Lecturer;

  factory Lecturer.fromJson(Map<String, dynamic> json) =>
      _$LecturerFromJson(json);
}
