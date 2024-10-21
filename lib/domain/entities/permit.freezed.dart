// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Permit _$PermitFromJson(Map<String, dynamic> json) {
  return _Permit.fromJson(json);
}

/// @nodoc
mixin _$Permit {
  int? get id => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get evidence => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;

  /// Serializes this Permit to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Permit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PermitCopyWith<Permit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermitCopyWith<$Res> {
  factory $PermitCopyWith(Permit value, $Res Function(Permit) then) =
      _$PermitCopyWithImpl<$Res, Permit>;
  @useResult
  $Res call(
      {int? id,
      DateTime? startDate,
      DateTime? endDate,
      String? description,
      String? evidence,
      User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$PermitCopyWithImpl<$Res, $Val extends Permit>
    implements $PermitCopyWith<$Res> {
  _$PermitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Permit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? description = freezed,
    Object? evidence = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      evidence: freezed == evidence
          ? _value.evidence
          : evidence // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }

  /// Create a copy of Permit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PermitImplCopyWith<$Res> implements $PermitCopyWith<$Res> {
  factory _$$PermitImplCopyWith(
          _$PermitImpl value, $Res Function(_$PermitImpl) then) =
      __$$PermitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      DateTime? startDate,
      DateTime? endDate,
      String? description,
      String? evidence,
      User? user});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$PermitImplCopyWithImpl<$Res>
    extends _$PermitCopyWithImpl<$Res, _$PermitImpl>
    implements _$$PermitImplCopyWith<$Res> {
  __$$PermitImplCopyWithImpl(
      _$PermitImpl _value, $Res Function(_$PermitImpl) _then)
      : super(_value, _then);

  /// Create a copy of Permit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? description = freezed,
    Object? evidence = freezed,
    Object? user = freezed,
  }) {
    return _then(_$PermitImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      evidence: freezed == evidence
          ? _value.evidence
          : evidence // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PermitImpl implements _Permit {
  const _$PermitImpl(
      {this.id,
      this.startDate,
      this.endDate,
      this.description,
      this.evidence,
      this.user});

  factory _$PermitImpl.fromJson(Map<String, dynamic> json) =>
      _$$PermitImplFromJson(json);

  @override
  final int? id;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  final String? description;
  @override
  final String? evidence;
  @override
  final User? user;

  @override
  String toString() {
    return 'Permit(id: $id, startDate: $startDate, endDate: $endDate, description: $description, evidence: $evidence, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermitImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.evidence, evidence) ||
                other.evidence == evidence) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, startDate, endDate, description, evidence, user);

  /// Create a copy of Permit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PermitImplCopyWith<_$PermitImpl> get copyWith =>
      __$$PermitImplCopyWithImpl<_$PermitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PermitImplToJson(
      this,
    );
  }
}

abstract class _Permit implements Permit {
  const factory _Permit(
      {final int? id,
      final DateTime? startDate,
      final DateTime? endDate,
      final String? description,
      final String? evidence,
      final User? user}) = _$PermitImpl;

  factory _Permit.fromJson(Map<String, dynamic> json) = _$PermitImpl.fromJson;

  @override
  int? get id;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  String? get description;
  @override
  String? get evidence;
  @override
  User? get user;

  /// Create a copy of Permit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PermitImplCopyWith<_$PermitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
