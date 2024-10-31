// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Attendance _$AttendanceFromJson(Map<String, dynamic> json) {
  return _Attendance.fromJson(json);
}

/// @nodoc
mixin _$Attendance {
  int? get id => throw _privateConstructorUsedError;
  int? get sakit => throw _privateConstructorUsedError;
  int? get izin => throw _privateConstructorUsedError;
  int? get alpha => throw _privateConstructorUsedError;
  String? get entryTime => throw _privateConstructorUsedError;
  bool? get isChanged => throw _privateConstructorUsedError;
  bool? get lecturerVerified => throw _privateConstructorUsedError;

  /// Serializes this Attendance to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Attendance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttendanceCopyWith<Attendance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceCopyWith<$Res> {
  factory $AttendanceCopyWith(
          Attendance value, $Res Function(Attendance) then) =
      _$AttendanceCopyWithImpl<$Res, Attendance>;
  @useResult
  $Res call(
      {int? id,
      int? sakit,
      int? izin,
      int? alpha,
      String? entryTime,
      bool? isChanged,
      bool? lecturerVerified});
}

/// @nodoc
class _$AttendanceCopyWithImpl<$Res, $Val extends Attendance>
    implements $AttendanceCopyWith<$Res> {
  _$AttendanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Attendance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? sakit = freezed,
    Object? izin = freezed,
    Object? alpha = freezed,
    Object? entryTime = freezed,
    Object? isChanged = freezed,
    Object? lecturerVerified = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      sakit: freezed == sakit
          ? _value.sakit
          : sakit // ignore: cast_nullable_to_non_nullable
              as int?,
      izin: freezed == izin
          ? _value.izin
          : izin // ignore: cast_nullable_to_non_nullable
              as int?,
      alpha: freezed == alpha
          ? _value.alpha
          : alpha // ignore: cast_nullable_to_non_nullable
              as int?,
      entryTime: freezed == entryTime
          ? _value.entryTime
          : entryTime // ignore: cast_nullable_to_non_nullable
              as String?,
      isChanged: freezed == isChanged
          ? _value.isChanged
          : isChanged // ignore: cast_nullable_to_non_nullable
              as bool?,
      lecturerVerified: freezed == lecturerVerified
          ? _value.lecturerVerified
          : lecturerVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceImplCopyWith<$Res>
    implements $AttendanceCopyWith<$Res> {
  factory _$$AttendanceImplCopyWith(
          _$AttendanceImpl value, $Res Function(_$AttendanceImpl) then) =
      __$$AttendanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? sakit,
      int? izin,
      int? alpha,
      String? entryTime,
      bool? isChanged,
      bool? lecturerVerified});
}

/// @nodoc
class __$$AttendanceImplCopyWithImpl<$Res>
    extends _$AttendanceCopyWithImpl<$Res, _$AttendanceImpl>
    implements _$$AttendanceImplCopyWith<$Res> {
  __$$AttendanceImplCopyWithImpl(
      _$AttendanceImpl _value, $Res Function(_$AttendanceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Attendance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? sakit = freezed,
    Object? izin = freezed,
    Object? alpha = freezed,
    Object? entryTime = freezed,
    Object? isChanged = freezed,
    Object? lecturerVerified = freezed,
  }) {
    return _then(_$AttendanceImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      sakit: freezed == sakit
          ? _value.sakit
          : sakit // ignore: cast_nullable_to_non_nullable
              as int?,
      izin: freezed == izin
          ? _value.izin
          : izin // ignore: cast_nullable_to_non_nullable
              as int?,
      alpha: freezed == alpha
          ? _value.alpha
          : alpha // ignore: cast_nullable_to_non_nullable
              as int?,
      entryTime: freezed == entryTime
          ? _value.entryTime
          : entryTime // ignore: cast_nullable_to_non_nullable
              as String?,
      isChanged: freezed == isChanged
          ? _value.isChanged
          : isChanged // ignore: cast_nullable_to_non_nullable
              as bool?,
      lecturerVerified: freezed == lecturerVerified
          ? _value.lecturerVerified
          : lecturerVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendanceImpl implements _Attendance {
  const _$AttendanceImpl(
      {this.id,
      this.sakit,
      this.izin,
      this.alpha,
      this.entryTime,
      this.isChanged,
      this.lecturerVerified});

  factory _$AttendanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceImplFromJson(json);

  @override
  final int? id;
  @override
  final int? sakit;
  @override
  final int? izin;
  @override
  final int? alpha;
  @override
  final String? entryTime;
  @override
  final bool? isChanged;
  @override
  final bool? lecturerVerified;

  @override
  String toString() {
    return 'Attendance(id: $id, sakit: $sakit, izin: $izin, alpha: $alpha, entryTime: $entryTime, isChanged: $isChanged, lecturerVerified: $lecturerVerified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sakit, sakit) || other.sakit == sakit) &&
            (identical(other.izin, izin) || other.izin == izin) &&
            (identical(other.alpha, alpha) || other.alpha == alpha) &&
            (identical(other.entryTime, entryTime) ||
                other.entryTime == entryTime) &&
            (identical(other.isChanged, isChanged) ||
                other.isChanged == isChanged) &&
            (identical(other.lecturerVerified, lecturerVerified) ||
                other.lecturerVerified == lecturerVerified));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, sakit, izin, alpha,
      entryTime, isChanged, lecturerVerified);

  /// Create a copy of Attendance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceImplCopyWith<_$AttendanceImpl> get copyWith =>
      __$$AttendanceImplCopyWithImpl<_$AttendanceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceImplToJson(
      this,
    );
  }
}

abstract class _Attendance implements Attendance {
  const factory _Attendance(
      {final int? id,
      final int? sakit,
      final int? izin,
      final int? alpha,
      final String? entryTime,
      final bool? isChanged,
      final bool? lecturerVerified}) = _$AttendanceImpl;

  factory _Attendance.fromJson(Map<String, dynamic> json) =
      _$AttendanceImpl.fromJson;

  @override
  int? get id;
  @override
  int? get sakit;
  @override
  int? get izin;
  @override
  int? get alpha;
  @override
  String? get entryTime;
  @override
  bool? get isChanged;
  @override
  bool? get lecturerVerified;

  /// Create a copy of Attendance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttendanceImplCopyWith<_$AttendanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
