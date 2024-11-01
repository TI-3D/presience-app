// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permit_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PermitDetail _$PermitDetailFromJson(Map<String, dynamic> json) {
  return _PermitDetail.fromJson(json);
}

/// @nodoc
mixin _$PermitDetail {
  int? get id => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  Permit? get permit => throw _privateConstructorUsedError;
  ScheduleWeek? get scheduleWeek => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this PermitDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PermitDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PermitDetailCopyWith<PermitDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermitDetailCopyWith<$Res> {
  factory $PermitDetailCopyWith(
          PermitDetail value, $Res Function(PermitDetail) then) =
      _$PermitDetailCopyWithImpl<$Res, PermitDetail>;
  @useResult
  $Res call(
      {int? id,
      String? status,
      Permit? permit,
      ScheduleWeek? scheduleWeek,
      DateTime? createdAt});

  $PermitCopyWith<$Res>? get permit;
  $ScheduleWeekCopyWith<$Res>? get scheduleWeek;
}

/// @nodoc
class _$PermitDetailCopyWithImpl<$Res, $Val extends PermitDetail>
    implements $PermitDetailCopyWith<$Res> {
  _$PermitDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PermitDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? permit = freezed,
    Object? scheduleWeek = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      permit: freezed == permit
          ? _value.permit
          : permit // ignore: cast_nullable_to_non_nullable
              as Permit?,
      scheduleWeek: freezed == scheduleWeek
          ? _value.scheduleWeek
          : scheduleWeek // ignore: cast_nullable_to_non_nullable
              as ScheduleWeek?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of PermitDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PermitCopyWith<$Res>? get permit {
    if (_value.permit == null) {
      return null;
    }

    return $PermitCopyWith<$Res>(_value.permit!, (value) {
      return _then(_value.copyWith(permit: value) as $Val);
    });
  }

  /// Create a copy of PermitDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ScheduleWeekCopyWith<$Res>? get scheduleWeek {
    if (_value.scheduleWeek == null) {
      return null;
    }

    return $ScheduleWeekCopyWith<$Res>(_value.scheduleWeek!, (value) {
      return _then(_value.copyWith(scheduleWeek: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PermitDetailImplCopyWith<$Res>
    implements $PermitDetailCopyWith<$Res> {
  factory _$$PermitDetailImplCopyWith(
          _$PermitDetailImpl value, $Res Function(_$PermitDetailImpl) then) =
      __$$PermitDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? status,
      Permit? permit,
      ScheduleWeek? scheduleWeek,
      DateTime? createdAt});

  @override
  $PermitCopyWith<$Res>? get permit;
  @override
  $ScheduleWeekCopyWith<$Res>? get scheduleWeek;
}

/// @nodoc
class __$$PermitDetailImplCopyWithImpl<$Res>
    extends _$PermitDetailCopyWithImpl<$Res, _$PermitDetailImpl>
    implements _$$PermitDetailImplCopyWith<$Res> {
  __$$PermitDetailImplCopyWithImpl(
      _$PermitDetailImpl _value, $Res Function(_$PermitDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of PermitDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? permit = freezed,
    Object? scheduleWeek = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$PermitDetailImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      permit: freezed == permit
          ? _value.permit
          : permit // ignore: cast_nullable_to_non_nullable
              as Permit?,
      scheduleWeek: freezed == scheduleWeek
          ? _value.scheduleWeek
          : scheduleWeek // ignore: cast_nullable_to_non_nullable
              as ScheduleWeek?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PermitDetailImpl implements _PermitDetail {
  const _$PermitDetailImpl(
      {this.id, this.status, this.permit, this.scheduleWeek, this.createdAt});

  factory _$PermitDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$PermitDetailImplFromJson(json);

  @override
  final int? id;
  @override
  final String? status;
  @override
  final Permit? permit;
  @override
  final ScheduleWeek? scheduleWeek;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'PermitDetail(id: $id, status: $status, permit: $permit, scheduleWeek: $scheduleWeek, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermitDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.permit, permit) || other.permit == permit) &&
            (identical(other.scheduleWeek, scheduleWeek) ||
                other.scheduleWeek == scheduleWeek) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, status, permit, scheduleWeek, createdAt);

  /// Create a copy of PermitDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PermitDetailImplCopyWith<_$PermitDetailImpl> get copyWith =>
      __$$PermitDetailImplCopyWithImpl<_$PermitDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PermitDetailImplToJson(
      this,
    );
  }
}

abstract class _PermitDetail implements PermitDetail {
  const factory _PermitDetail(
      {final int? id,
      final String? status,
      final Permit? permit,
      final ScheduleWeek? scheduleWeek,
      final DateTime? createdAt}) = _$PermitDetailImpl;

  factory _PermitDetail.fromJson(Map<String, dynamic> json) =
      _$PermitDetailImpl.fromJson;

  @override
  int? get id;
  @override
  String? get status;
  @override
  Permit? get permit;
  @override
  ScheduleWeek? get scheduleWeek;
  @override
  DateTime? get createdAt;

  /// Create a copy of PermitDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PermitDetailImplCopyWith<_$PermitDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
