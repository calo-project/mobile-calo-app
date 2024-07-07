// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  int? get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get email_verified_at => throw _privateConstructorUsedError;
  String? get nama_pengguna => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  String? get foto_profile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {int? id,
      String email,
      String? email_verified_at,
      String? nama_pengguna,
      String? role,
      String? foto_profile});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? email = null,
    Object? email_verified_at = freezed,
    Object? nama_pengguna = freezed,
    Object? role = freezed,
    Object? foto_profile = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      email_verified_at: freezed == email_verified_at
          ? _value.email_verified_at
          : email_verified_at // ignore: cast_nullable_to_non_nullable
              as String?,
      nama_pengguna: freezed == nama_pengguna
          ? _value.nama_pengguna
          : nama_pengguna // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      foto_profile: freezed == foto_profile
          ? _value.foto_profile
          : foto_profile // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String email,
      String? email_verified_at,
      String? nama_pengguna,
      String? role,
      String? foto_profile});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? email = null,
    Object? email_verified_at = freezed,
    Object? nama_pengguna = freezed,
    Object? role = freezed,
    Object? foto_profile = freezed,
  }) {
    return _then(_$UserImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      email_verified_at: freezed == email_verified_at
          ? _value.email_verified_at
          : email_verified_at // ignore: cast_nullable_to_non_nullable
              as String?,
      nama_pengguna: freezed == nama_pengguna
          ? _value.nama_pengguna
          : nama_pengguna // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      foto_profile: freezed == foto_profile
          ? _value.foto_profile
          : foto_profile // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {this.id,
      required this.email,
      this.email_verified_at,
      this.nama_pengguna,
      this.role,
      this.foto_profile});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final int? id;
  @override
  final String email;
  @override
  final String? email_verified_at;
  @override
  final String? nama_pengguna;
  @override
  final String? role;
  @override
  final String? foto_profile;

  @override
  String toString() {
    return 'User(id: $id, email: $email, email_verified_at: $email_verified_at, nama_pengguna: $nama_pengguna, role: $role, foto_profile: $foto_profile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.email_verified_at, email_verified_at) ||
                other.email_verified_at == email_verified_at) &&
            (identical(other.nama_pengguna, nama_pengguna) ||
                other.nama_pengguna == nama_pengguna) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.foto_profile, foto_profile) ||
                other.foto_profile == foto_profile));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, email_verified_at,
      nama_pengguna, role, foto_profile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {final int? id,
      required final String email,
      final String? email_verified_at,
      final String? nama_pengguna,
      final String? role,
      final String? foto_profile}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  int? get id;
  @override
  String get email;
  @override
  String? get email_verified_at;
  @override
  String? get nama_pengguna;
  @override
  String? get role;
  @override
  String? get foto_profile;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
