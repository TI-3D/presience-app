// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_week.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScheduleWeek _$ScheduleWeekFromJson(Map<String, dynamic> json) {
  return _ScheduleWeek.fromJson(json);
}

/// @nodoc
mixin _$ScheduleWeek {
  int? get id => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  bool? get isOnline => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get openedAt => throw _privateConstructorUsedError;
  String? get closedAt => throw _privateConstructorUsedError;
  Schedule? get schedule => throw _privateConstructorUsedError;
  Attendance? get attendance => throw _privateConstructorUsedError;

  /// Serializes this ScheduleWeek to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScheduleWeek
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScheduleWeekCopyWith<ScheduleWeek> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleWeekCopyWith<$Res> {
  factory $ScheduleWeekCopyWith(
          ScheduleWeek value, $Res Function(ScheduleWeek) then) =
      _$ScheduleWeekCopyWithImpl<$Res, ScheduleWeek>;
  @useResult
  $Res call(
      {int? id,
      DateTime? date,
      bool? isOnline,
      String? status,
      String? openedAt,
      String? closedAt,
      Schedule? schedule,
      Attendance? attendance});

  $ScheduleCopyWith<$Res>? get schedule;
  $AttendanceCopyWith<$Res>? get attendance;
}

/// @nodoc
class _$ScheduleWeekCopyWithImpl<$Res, $Val extends ScheduleWeek>
    implements $ScheduleWeekCopyWith<$Res> {
  _$ScheduleWeekCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScheduleWeek
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? isOnline = freezed,
    Object? status = freezed,
    Object? openedAt = freezed,
    Object? closedAt = freezed,
    Object? schedule = freezed,
    Object? attendance = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isOnline: freezed == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      openedAt: freezed == openedAt
          ? _value.openedAt
          : openedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      closedAt: freezed == closedAt
          ? _value.closedAt
          : closedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      schedule: freezed == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as Schedule?,
      attendance: freezed == attendance
          ? _value.attendance
          : attendance // ignore: cast_nullable_to_non_nullable
              as Attendance?,
    ) as $Val);
  }

  /// Create a copy of ScheduleWeek
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ScheduleCopyWith<$Res>? get schedule {
    if (_value.schedule == null) {
      return null;
    }

    return $ScheduleCopyWith<$Res>(_value.schedule!, (value) {
      return _then(_value.copyWith(schedule: value) as $Val);
    });
  }

  /// Create a copy of ScheduleWeek
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AttendanceCopyWith<$Res>? get attendance {
    if (_value.attendance == null) {
      return null;
    }

    return $AttendanceCopyWith<$Res>(_value.attendance!, (value) {
      return _then(_value.copyWith(attendance: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ScheduleWeekImplCopyWith<$Res>
    implements $ScheduleWeekCopyWith<$Res> {
  factory _$$ScheduleWeekImplCopyWith(
          _$ScheduleWeekImpl value, $Res Function(_$ScheduleWeekImpl) then) =
      __$$ScheduleWeekImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      DateTime? date,
      bool? isOnline,
      String? status,
      String? openedAt,
      String? closedAt,
      Schedule? schedule,
      Attendance? attendance});

  @override
  $ScheduleCopyWith<$Res>? get schedule;
  @override
  $AttendanceCopyWith<$Res>? get attendance;
}

/// @nodoc
class __$$ScheduleWeekImplCopyWithImpl<$Res>
    extends _$ScheduleWeekCopyWithImpl<$Res, _$ScheduleWeekImpl>
    implements _$$ScheduleWeekImplCopyWith<$Res> {
  __$$ScheduleWeekImplCopyWithImpl(
      _$ScheduleWeekImpl _value, $Res Function(_$ScheduleWeekImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScheduleWeek
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? isOnline = freezed,
    Object? status = freezed,
    Object? openedAt = freezed,
    Object? closedAt = freezed,
    Object? schedule = freezed,
    Object? attendance = freezed,
  }) {
    return _then(_$ScheduleWeekImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isOnline: freezed == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      openedAt: freezed == openedAt
          ? _value.openedAt
          : openedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      closedAt: freezed == closedAt
          ? _value.closedAt
          : closedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      schedule: freezed == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as Schedule?,
      attendance: freezed == attendance
          ? _value.attendance
          : attendance // ignore: cast_nullable_to_non_nullable
              as Attendance?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleWeekImpl implements _ScheduleWeek {
  const _$ScheduleWeekImpl(
      {this.id,
      this.date,
      this.isOnline,
      this.status,
      this.openedAt,
      this.closedAt,
      this.schedule,
      this.attendance});

  factory _$ScheduleWeekImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleWeekImplFromJson(json);

  @override
  final int? id;
  @override
  final DateTime? date;
  @override
  final bool? isOnline;
  @override
  final String? status;
  @override
  final String? openedAt;
  @override
  final String? closedAt;
  @override
  final Schedule? schedule;
  @override
  final Attendance? attendance;

  @override
  String toString() {
    return 'ScheduleWeek(id: $id, date: $date, isOnline: $isOnline, status: $status, openedAt: $openedAt, closedAt: $closedAt, schedule: $schedule, attendance: $attendance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleWeekImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.openedAt, openedAt) ||
                other.openedAt == openedAt) &&
            (identical(other.closedAt, closedAt) ||
                other.closedAt == closedAt) &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule) &&
            (identical(other.attendance, attendance) ||
                other.attendance == attendance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, isOnline, status,
      openedAt, closedAt, schedule, attendance);

  /// Create a copy of ScheduleWeek
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleWeekImplCopyWith<_$ScheduleWeekImpl> get copyWith =>
      __$$ScheduleWeekImplCopyWithImpl<_$ScheduleWeekImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleWeekImplToJson(
      this,
    );
  }
}

abstract class _ScheduleWeek implements ScheduleWeek {
  const factory _ScheduleWeek(
      {final int? id,
      final DateTime? date,
      final bool? isOnline,
      final String? status,
      final String? openedAt,
      final String? closedAt,
      final Schedule? schedule,
      final Attendance? attendance}) = _$ScheduleWeekImpl;

  factory _ScheduleWeek.fromJson(Map<String, dynamic> json) =
      _$ScheduleWeekImpl.fromJson;

  @override
  int? get id;
  @override
  DateTime? get date;
  @override
  bool? get isOnline;
  @override
  String? get status;
  @override
  String? get openedAt;
  @override
  String? get closedAt;
  @override
  Schedule? get schedule;
  @override
  Attendance? get attendance;

  /// Create a copy of ScheduleWeek
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScheduleWeekImplCopyWith<_$ScheduleWeekImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
