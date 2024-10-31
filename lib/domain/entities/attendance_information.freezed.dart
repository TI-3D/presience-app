// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_information.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AttendanceInformation _$AttendanceInformationFromJson(
    Map<String, dynamic> json) {
  return _AttendanceInformation.fromJson(json);
}

/// @nodoc
mixin _$AttendanceInformation {
  int? get percentageAttendance => throw _privateConstructorUsedError;
  int? get sakit => throw _privateConstructorUsedError;
  int? get izin => throw _privateConstructorUsedError;
  int? get alpha => throw _privateConstructorUsedError;
  int? get kompen => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this AttendanceInformation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AttendanceInformation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttendanceInformationCopyWith<AttendanceInformation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceInformationCopyWith<$Res> {
  factory $AttendanceInformationCopyWith(AttendanceInformation value,
          $Res Function(AttendanceInformation) then) =
      _$AttendanceInformationCopyWithImpl<$Res, AttendanceInformation>;
  @useResult
  $Res call(
      {int? percentageAttendance,
      int? sakit,
      int? izin,
      int? alpha,
      int? kompen,
      String? description});
}

/// @nodoc
class _$AttendanceInformationCopyWithImpl<$Res,
        $Val extends AttendanceInformation>
    implements $AttendanceInformationCopyWith<$Res> {
  _$AttendanceInformationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttendanceInformation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? percentageAttendance = freezed,
    Object? sakit = freezed,
    Object? izin = freezed,
    Object? alpha = freezed,
    Object? kompen = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      percentageAttendance: freezed == percentageAttendance
          ? _value.percentageAttendance
          : percentageAttendance // ignore: cast_nullable_to_non_nullable
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
      kompen: freezed == kompen
          ? _value.kompen
          : kompen // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceInformationImplCopyWith<$Res>
    implements $AttendanceInformationCopyWith<$Res> {
  factory _$$AttendanceInformationImplCopyWith(
          _$AttendanceInformationImpl value,
          $Res Function(_$AttendanceInformationImpl) then) =
      __$$AttendanceInformationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? percentageAttendance,
      int? sakit,
      int? izin,
      int? alpha,
      int? kompen,
      String? description});
}

/// @nodoc
class __$$AttendanceInformationImplCopyWithImpl<$Res>
    extends _$AttendanceInformationCopyWithImpl<$Res,
        _$AttendanceInformationImpl>
    implements _$$AttendanceInformationImplCopyWith<$Res> {
  __$$AttendanceInformationImplCopyWithImpl(_$AttendanceInformationImpl _value,
      $Res Function(_$AttendanceInformationImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendanceInformation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? percentageAttendance = freezed,
    Object? sakit = freezed,
    Object? izin = freezed,
    Object? alpha = freezed,
    Object? kompen = freezed,
    Object? description = freezed,
  }) {
    return _then(_$AttendanceInformationImpl(
      percentageAttendance: freezed == percentageAttendance
          ? _value.percentageAttendance
          : percentageAttendance // ignore: cast_nullable_to_non_nullable
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
      kompen: freezed == kompen
          ? _value.kompen
          : kompen // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendanceInformationImpl implements _AttendanceInformation {
  const _$AttendanceInformationImpl(
      {this.percentageAttendance,
      this.sakit,
      this.izin,
      this.alpha,
      this.kompen,
      this.description});

  factory _$AttendanceInformationImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceInformationImplFromJson(json);

  @override
  final int? percentageAttendance;
  @override
  final int? sakit;
  @override
  final int? izin;
  @override
  final int? alpha;
  @override
  final int? kompen;
  @override
  final String? description;

  @override
  String toString() {
    return 'AttendanceInformation(percentageAttendance: $percentageAttendance, sakit: $sakit, izin: $izin, alpha: $alpha, kompen: $kompen, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceInformationImpl &&
            (identical(other.percentageAttendance, percentageAttendance) ||
                other.percentageAttendance == percentageAttendance) &&
            (identical(other.sakit, sakit) || other.sakit == sakit) &&
            (identical(other.izin, izin) || other.izin == izin) &&
            (identical(other.alpha, alpha) || other.alpha == alpha) &&
            (identical(other.kompen, kompen) || other.kompen == kompen) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, percentageAttendance, sakit,
      izin, alpha, kompen, description);

  /// Create a copy of AttendanceInformation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceInformationImplCopyWith<_$AttendanceInformationImpl>
      get copyWith => __$$AttendanceInformationImplCopyWithImpl<
          _$AttendanceInformationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceInformationImplToJson(
      this,
    );
  }
}

abstract class _AttendanceInformation implements AttendanceInformation {
  const factory _AttendanceInformation(
      {final int? percentageAttendance,
      final int? sakit,
      final int? izin,
      final int? alpha,
      final int? kompen,
      final String? description}) = _$AttendanceInformationImpl;

  factory _AttendanceInformation.fromJson(Map<String, dynamic> json) =
      _$AttendanceInformationImpl.fromJson;

  @override
  int? get percentageAttendance;
  @override
  int? get sakit;
  @override
  int? get izin;
  @override
  int? get alpha;
  @override
  int? get kompen;
  @override
  String? get description;

  /// Create a copy of AttendanceInformation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttendanceInformationImplCopyWith<_$AttendanceInformationImpl>
      get copyWith => throw _privateConstructorUsedError;
}
