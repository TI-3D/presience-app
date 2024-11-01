import 'package:freezed_annotation/freezed_annotation.dart';

part 'permit.freezed.dart';
part 'permit.g.dart';

@freezed
class Permit with _$Permit {
  const factory Permit({
    int? id,
    DateTime? startDate,
    DateTime? endDate,
    String? typePermit,
    String? description,
    String? evidence,
  }) = _Permit;

  factory Permit.fromJson(Map<String, dynamic> json) => Permit(
        id: json['id'],
        startDate: DateTime.parse(json['start_date']),
        endDate: DateTime.parse(json['end_date']),
        typePermit: json['type_permit'],
        description: json['description'],
        evidence: json['evidences'],
      );
}
