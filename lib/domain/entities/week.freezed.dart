// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'week.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Week _$WeekFromJson(Map<String, dynamic> json) {
  return _Week.fromJson(json);
}

/// @nodoc
mixin _$Week {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;

  /// Serializes this Week to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Week
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeekCopyWith<Week> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeekCopyWith<$Res> {
  factory $WeekCopyWith(Week value, $Res Function(Week) then) =
      _$WeekCopyWithImpl<$Res, Week>;
  @useResult
  $Res call({int? id, String? name, DateTime? startDate, DateTime? endDate});
}

/// @nodoc
class _$WeekCopyWithImpl<$Res, $Val extends Week>
    implements $WeekCopyWith<$Res> {
  _$WeekCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Week
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeekImplCopyWith<$Res> implements $WeekCopyWith<$Res> {
  factory _$$WeekImplCopyWith(
          _$WeekImpl value, $Res Function(_$WeekImpl) then) =
      __$$WeekImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, DateTime? startDate, DateTime? endDate});
}

/// @nodoc
class __$$WeekImplCopyWithImpl<$Res>
    extends _$WeekCopyWithImpl<$Res, _$WeekImpl>
    implements _$$WeekImplCopyWith<$Res> {
  __$$WeekImplCopyWithImpl(_$WeekImpl _value, $Res Function(_$WeekImpl) _then)
      : super(_value, _then);

  /// Create a copy of Week
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_$WeekImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeekImpl implements _Week {
  const _$WeekImpl({this.id, this.name, this.startDate, this.endDate});

  factory _$WeekImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeekImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;

  @override
  String toString() {
    return 'Week(id: $id, name: $name, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeekImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, startDate, endDate);

  /// Create a copy of Week
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeekImplCopyWith<_$WeekImpl> get copyWith =>
      __$$WeekImplCopyWithImpl<_$WeekImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeekImplToJson(
      this,
    );
  }
}

abstract class _Week implements Week {
  const factory _Week(
      {final int? id,
      final String? name,
      final DateTime? startDate,
      final DateTime? endDate}) = _$WeekImpl;

  factory _Week.fromJson(Map<String, dynamic> json) = _$WeekImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;

  /// Create a copy of Week
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeekImplCopyWith<_$WeekImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
